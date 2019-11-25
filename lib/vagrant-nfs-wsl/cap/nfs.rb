require 'vagrant-nfs-wsl'
require 'vagrant-nfs-wsl/windows_service'

module VagrantPlugins
  module VagrantNfsWsl
    module Cap
      class NFS

        def initialize(maniche, config)
          @config = config

          printf("---- config\n")

        end

        def self.nfs_config_file_path
          VagrantNfsWsl.get_nfs_dir.join('exports')
        end

        def self.logger
          Log4r::Logger.new("vagrant::hosts::windows::nfs")
        end

        def self.service_name
          "NFSserver"
        end

        def self.nfs_export(env, ui, id, ips, folders)
          # Get some values we need before we do anything

          output = ""

          folders.each do |folder, opts|
            if opts[:nfs] = true
              # Build config
              ips.each do |ip|
                output += "%s -mapall:1000:1000 -exec -alldirs %s ##VAGRANT#%s#\n" % [opts[:hostpath].gsub('/', '\\'),ip,id]
              end
            end

            # Remove entries with id
            nfs_cleanup(id)

            # Append to config
            logger.info("Write nfs exports")

            # restart nfs
            logger.info("Restart nfs")
            nfs_apply_command = env.host.capability(:nfs_apply_command)
          end
        end

        def self.nfs_installed(env)
          true
        end

        def self.nfs_cleanup(id)
          return if !File.exist?(nfs_config_file_path)

          #id_re = Regexp.escape(id.to_s)

          output = ""

          # read per line
          open(nfs_config_file_path, 'r').each do |line|
            match = line.scan(/##VAGRANT#([^#]*)#/)
            if match.length > 0
              next if match[0][0] == id.to_s
            end
            output += line
          end

          # write to file
          open(nfs_config_file_path, 'w') do |f|
            f.write output
            f.flush
            f.close
          end
        end

        def self.nfs_prune(environment, ui, valid_ids)
          # TODO Implement me
        end

        def self.nfs_apply_command(env)
          service = WindowsService.new('NFSserver')
          service.restart
        end

        def self.nfs_check_command(env)
          service = WindowsService.new('NFSserver')
          service.status
        end

        def self.nfs_start_command(env)
          service = WindowsService.new('NFSserver')
          service.start
        end
      end
    end
  end
end
