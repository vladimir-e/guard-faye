require 'guard'
require 'guard/guard'
require 'sys/proctable'

include Sys

module Guard
  class Faye < Guard

    def initialize(watchers = [], options = {})
      super

      @current_path = options[:path]
      @faye_init    = options[:config]
      @faye_env     = options[:faye_env] || 'test'
    end

    def start
      cmd = "cd #{@current_path} && bundle exec rackup #{@current_path}/#{@faye_init} -s thin -E #{@faye_env}"
      
      result = ''
      
      Thread.new do
        result = %x[#{cmd}]    
      end
    end

    def stop
      parent_pids = []

      Sys::ProcTable.ps.each do |ps|
        if ps.cmdline =~ /faye_test\.ru/i
          parent_pids << ps.pid
          Process.kill('KILL', ps.pid)
        end

        if parent_pids.include? ps.ppid
          Process.kill('KILL', ps.pid)
        end
      end
    end

    def reload
      stop
      start
    end

    def run_on_change(paths)
      reload
    end
  end
end
