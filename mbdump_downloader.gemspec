# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mbdump_downloader/version'

Gem::Specification.new do |spec|
  spec.name          = 'mbdump_downloader'
  spec.version       = MBDumpDownloader::VERSION
  spec.authors       = ['Steve Viselli']
  spec.email         = ['steve.viselli@gmail.com']
  spec.summary       = %q{Download the latest MusicBrainz database dumps.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
