require Vagrant.source_root.join("plugins/hosts/windows/host")

module VagrantPlugins
  module VagrantHanewinNfs
    class Host < VagrantPlugins::HostLinux::Host
    end
  end
end
