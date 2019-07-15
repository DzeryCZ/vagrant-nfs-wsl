module VagrantPlugins
  module VagrantHanewinNfs
    require 'vagrant-hanewin-nfs-wsl/version'
    require 'vagrant-hanewin-nfs-wsl/plugin'

    def self.source_root
      @source_root ||= Pathname.new(File.expand_path("../../", __FILE__))
    end

    def self.get_nfs_dir
      Pathname.new("/c/Program Files/nfsd/")
      # Todo - do it as a parameter
    end

    def self.get_nfs_path(file)
      get_nfs_dir.join(file)
    end
  end
end
