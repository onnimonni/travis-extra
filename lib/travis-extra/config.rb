require 'yaml'

module TravisExtra
  class Config
    def self.parse(args)
      if args[:file]
        return YAML.load_file(args[:file]) if File.exist?(args[:file])
        raise ConfigNotFoundError, "#{args[:file]} not found"  
      else
        CONFIG_FILES.each do |file|
          return YAML.load_file(file) if File.exist?(file)
        end
        raise ConfigNotFoundError, "./.travis-extra.yml not found"
      end
    end

    CONFIG_FILES=%w[ .travis-extra.yml .travis-extra.yaml ]
  end
end