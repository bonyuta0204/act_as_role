# frozen_string_literal: true

# set adapter to use, default is sqlite3
# to use an alternative adapter run => rake spec DB='postgresql'
db_name = ENV['DB'] || 'sqlite3'
database_yml = File.expand_path('../db/database.yml', __dir__)

unless File.exist?(database_yml)
  raise "Please create #{database_yml} first to configure your database. Take a look at: #{database_yml}.sample"
end

ActiveRecord::Base.configurations = YAML.load_file(database_yml)
ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), '../debug.log'))
ActiveRecord::Base.logger.level = ENV['CI'] ? ::Logger::ERROR : ::Logger::DEBUG
ActiveRecord::Migration.verbose = false
if ActiveRecord.version >= Gem::Version.new('7.0.0.alpha2')
  ActiveRecord.default_timezone = :utc
else
  ActiveRecord::Base.default_timezone = :utc
end
config = ActiveRecord::Base.configurations.configs_for(env_name: db_name)

begin
  ActiveRecord::Base.establish_connection(db_name.to_sym)
  ActiveRecord::Base.connection
rescue StandardError

  ActiveRecord::Base.establish_connection(config)
end


require "#{File.dirname(__FILE__)}/../db/schema.rb"

Dir["#{File.dirname(__dir__)}/models/*.rb"].each { |f| require f }
