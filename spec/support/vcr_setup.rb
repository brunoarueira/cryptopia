require 'vcr'

VCR.configure do |c|
  # the directory where your cassettes will be saved
  c.ignore_localhost = true
  c.cassette_library_dir = 'spec/vcr'
  # your HTTP request service. You can also use fakeweb, webmock, and more
  c.hook_into :webmock
end

RSpec.configure do |config|
  # Add VCR to all tests
  config.around(:each) do |example|
    options = example.metadata[:vcr] || {}
    if options[:record] == :skip
      VCR.turned_off(&example)
    else
      name = example
             .metadata[:description]
             .split(/\s+/, 2)
             .join('/')
             .gsub(/\./, '/')
             .gsub(%r{[^\w/]+}, '_')
             .gsub(%r{/$}, '')
      VCR.use_cassette(name, record: :once, &example)
    end
  end
end
