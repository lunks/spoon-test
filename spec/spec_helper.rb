require 'bundler'
Bundler.require(:default, :test)
ENV['RACK_ENV'] ||= 'test'

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.hook_into                :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :new_episodes }
  c.filter_sensitive_data('<SPACE_ID>') { ENV.fetch('CONTENTFUL_SPACE_ID') }
  c.filter_sensitive_data('<ACCESS_TOKEN>') { ENV.fetch('CONTENTFUL_ACCESS_TOKEN') }
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus
  config.disable_monkey_patching!
  if config.files_to_run.one?
    config.default_formatter = "doc"
  end
  config.order = :random
  Kernel.srand config.seed
end
