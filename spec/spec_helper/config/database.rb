RSpec.configure do |config|
  config.before(:each) { |example| DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction; DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end