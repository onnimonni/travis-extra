require 'yaml'

module TravisExtra
  class Config
    def self.parse(*args)
      CONFIG_FILES.each do |file|
        if File.exist?(file)
          return YAML.load_file(file)
        end
      end
      raise ConfigNotFoundError, "./.travis-extra.yml not found"
    end

    CONFIG_FILES=%w[ .travis-extra.yml, .travis-extra.yaml ]
  end
end