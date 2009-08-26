require 'test/unit'
require 'rubygems'
require File.expand_path(File.join(File.dirname(__FILE__), '../../../../config/environment.rb'))

require 'active_record'
require 'active_record/fixtures'

config = YAML::load(IO.read(File.dirname(__FILE__) + '/db/database.yml'))
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.configurations = {'test' => config[ENV['DB'] || 'sqlite3']}
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])

load(File.dirname(__FILE__) + '/db/schema.rb')

class ActiveSupport::TestCase
  include ActiveRecord::TestFixtures

  self.fixture_path = File.dirname(__FILE__) + '/fixtures/'

  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

  fixtures :all
end
