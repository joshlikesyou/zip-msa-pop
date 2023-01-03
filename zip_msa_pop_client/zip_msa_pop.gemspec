
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "zip_msa_pop/version"

Gem::Specification.new do |spec|
  spec.name          = "zip_msa_pop"
  spec.version       = ZipMsaPop::VERSION
  spec.authors       = ["Josh Evans"]
  spec.email         = ["joshlikesyou@gmail.com"]

  spec.summary       = %q{a stupid simple client}
  spec.description   = %q{Zip Msa Pop allows you to query the ZipPop api to return associated Metropolitan Statistical Area population data}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.12.1"
  spec.add_development_dependency "webmock", "~> 3.6"
  spec.add_dependency "httparty", ">= 0.17", "< 0.22"
end
