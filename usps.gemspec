Gem::Specification.new do |gem|
  gem.name          = 'usps'
  gem.version       = '0.1'
  gem.summary       = 'Thin wrapper around the USPS APIs'
  gem.description   = 'Thin wrapper around the USPS APIs'
  gem.license       = 'CC0'  # This work is a work of the US Federal Government,
  #               This work is Public Domain in the USA, and CC0 Internationally

  gem.authors       = 'Paul Tagliamonte'
  gem.email         = 'paul.tagliamonte@va.gov'
  gem.homepage      = ''

  gem.add_runtime_dependency 'nokogiri'
  gem.add_runtime_dependency 'nori'

  gem.files         = Dir['lib/**/*.rb']
  gem.require_paths = ["lib"]
end
