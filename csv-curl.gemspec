# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'csv-curl'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'CSV Curl'
  s.description = 'Tools making mulitple calls using curl'
  s.authors     = ['Doug Youch']
  s.email       = 'dougyouch@gmail.com'
  s.homepage    = 'https://github.com/dougyouch/csv-curl'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|examples)/}) }
  s.bindir      = 'bin'
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
end
