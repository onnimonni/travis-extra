$:.unshift File.expand_path("../lib", __FILE__)
require "travis-extra/version"

Gem::Specification.new do |s|
  s.name                  = "travis-extra"
  s.version               = TravisExtra::VERSION
  s.author                = "Onni Hakala"
  s.email                 = "onni@keksi.io"
  s.homepage              = "https://github.com/onnimonni/travis-extra"
  s.summary               = %q{helper for travis ci}
  s.description           = %q{helper for travis ci which adds few extra abilities}
  s.license               = 'MIT'
  s.files                 = `git ls-files`.split("\n")
  s.test_files            = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables           = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path          = 'lib'
  s.required_ruby_version = '>= 1.9.3'

  # prereleases from Travis CI for builds when tag is not set
  if ENV['CI'] and not ENV['TRAVIS_TAG']
    digits = s.version.to_s.split '.'
    digits[-1] = digits[-1].to_s.succ
    s.version = digits.join('.') + ".travis.#{ENV['TRAVIS_JOB_NUMBER']}"
  end
end