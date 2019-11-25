begin
  require 'vagrant'
rescue LoadError
  raise "The Vagrant Hanewin NFS plugin must be run within Vagrant."
end

if Vagrant::VERSION < "1.5.0"
  raise "The Vagrant Hanewin NFS plugin is only compatible with Vagrant 1.5.0+"
end

module VagrantPlugins
  module VagrantNfsWsl
    class Plugin < Vagrant.plugin(2)
      name 'vagrant-nfs-wsl'

      description <<-DESC
      This plugin adds NFS support on Windows for Vagrant with the Hanewin NFS Server.
      DESC

      config "vm" do |env|
        require_relative "config"
        Config
      end

      synced_folder("nfs") do
        require_relative "synced_folder"
        SyncedFolder
      end

      host("linux_nfs", "linux") do
        require_relative "host"
        Host
      end

      host_capability("linux_nfs", "nfs_export") do
        require_relative "cap/nfs"
        Cap::NFS
      end

      host_capability("linux_nfs", "nfs_installed") do
        require_relative "cap/nfs"
        Cap::NFS
      end

      host_capability("linux_nfs", "nfs_prune") do
        require_relative "cap/nfs"
        Cap::NFS
      end

      host_capability("linux_nfs", "nfs_apply_command") do
        require_relative "cap/nfs"
        Cap::NFS
      end

      host_capability("linux_nfs", "nfs_check_command") do
        require_relative "cap/nfs"
        Cap::NFS
      end

      host_capability("linux_nfs", "nfs_start_command") do
        require_relative "cap/nfs"
        Cap::NFS
      end

      def self.init_plugin
        I18n.load_path << File.expand_path('locales/en.yml', VagrantNfsWsl.source_root)
        I18n.reload!
      end

    end
  end
end
