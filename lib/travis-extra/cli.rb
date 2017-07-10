require 'travis-extra/config'
require 'travis-extra/errors'
require 'travis-extra/environment'

module TravisExtra
  class CLI
    def self.run(*args)
      new(args).run
    end

    OPTION_PATTERN = /\A--([a-z][a-z_\-]*)(?:=(.+))?\z/
    attr_accessor :options, :fold_count

    def initialize(*args)
      options = {}
      args.flatten.each do |arg|
        next options.update(arg) if arg.is_a? Hash
        die("invalid option %p" % arg) unless match = OPTION_PATTERN.match(arg)
        key = match[1].tr('-', '_').to_sym
        if options.include? key
          options[key] = Array(options[key]) << match[2]
        else
          options[key] = match[2] || true
        end
      end

      self.fold_count = 0
      self.options    = default_options.merge(options)
    end

    def run

      begin
        config = Config.parse
      rescue ConfigNotFoundError => e
        STDERR.puts "Error: #{e.message}"
        exit 1
      end

      if options[:load_env]
        if ENV['TRAVIS_BRANCH']
          Environment.output(config['env'])
        else
          STDERR.puts "Error: TRAVIS_BRANCH is not set. Are you using this locally?"
        end
      end
      
    end

    def default_options
      {
        :app      => File.basename(Dir.pwd),
        :key_name => %x[hostname].strip
      }
    end

    def shell(command)
      system(command)
    end

    def die(message)
      $stderr.puts(message)
      exit 1
    end

    def env
      ENV
    end
  end
end