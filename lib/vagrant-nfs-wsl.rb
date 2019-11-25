module VagrantPlugins
  module VagrantNfsWsl
    require 'vagrant-nfs-wsl/version'
    require 'vagrant-nfs-wsl/plugin'

    def self.source_root
      @source_root ||= Pathname.new(File.expand_path("../../", __FILE__))
    end

    def self.get_nfs_dir
      # Todo - do it via custom configuration
      Pathname.new("/c/Program Files/nfsd/")
    end
  end
end
