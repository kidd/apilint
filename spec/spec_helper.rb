$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'rspec'
require 'pry'

RSpec.configure do |config|
  config.order = 'random'
end
