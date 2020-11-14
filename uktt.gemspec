lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uktt/version'

Gem::Specification.new do |spec|
  spec.name          = 'uktt'
  spec.version       = Uktt::VERSION
  spec.authors       = ['Christopher Unger']
  spec.email         = ['christopher.unger@bitzesty.com']

  spec.summary       = 'A gem to work with the UK Trade Tariff API.'
  # spec.description   = %q{A gem to work with the UK Trade Tariff API.}
  spec.homepage      = 'https://gitlab.bitzesty.com/open-source/uktt'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://gitlab.com/'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://gitlab.bitzesty.com/open-source/uktt'
    spec.metadata['changelog_uri'] = 'https://gitlab.bitzesty.com/open-source/uktt/wikis/home'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'prawn'
  spec.add_dependency 'prawn-table'
  spec.add_dependency 'thor', '~> 0.20'
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
