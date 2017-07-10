module TravisExtra
  class Environment
    attr_accessor :env

    def self.output(config)
      new(config).output
    end

    def initialize(config)
      if config['branch'].key?(ENV['TRAVIS_BRANCH'])
        @env = config['branch'][ENV['TRAVIS_BRANCH']]
      end
    end

    def output
      unless @env.empty?
        puts "export " + @env.map{|k,v| "#{k}=#{v}"}.join(' ')
      end
    end
  end
end