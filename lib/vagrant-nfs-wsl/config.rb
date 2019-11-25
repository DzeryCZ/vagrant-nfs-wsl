require 'vagrant'
require Vagrant.source_root.join("plugins/kernel_v2/config/vm")

module VagrantPlugins
  module VagrantNfsWsl
    class Config < VagrantPlugins::Kernel_V2::VMConfig
      def finalize!
        switch_back = {}

        @__synced_folders.each do |id, options|
          if (options[:nfs] || options[:type] == :nfs || options[:type] == "nfs") && `uname -r | grep 'Microsoft'` != ''
            switch_back[id] = true
          end
        end

        super

        @__synced_folders.each do |id, options|
          if options[:type] != :nfs && !switch_back[id].nil?
            options[:type] = :nfs
          end
        end
      end
    end
  end
end
