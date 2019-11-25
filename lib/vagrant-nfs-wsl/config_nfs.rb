require 'vagrant'

# TODO - add to plugin.rb
# It throws /opt/vagrant/embedded/gems/2.2.4/gems/vagrant-2.2.4/lib/vagrant/plugin/v2/config.rb:73:in `method_missing': undefined method `verify_installed' for #<VagrantPlugins::VagrantNfsWsl::ConfigNfs:0x000000000305b498> (NoMethodError)
  # config("nfs") do |env|
      #   require_relative "config_nfs"
      #   ConfigNfs
      # end

module VagrantPlugins
  module VagrantNfsWsl
    class ConfigNfs < Vagrant.plugin(2, :config)
      attr_accessor :pathToExecutable
      def initialize
        @pathToExecutable = ''
      end
    end
  end
end
