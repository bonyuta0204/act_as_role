require "act_as_role/version"
require 'active_support/lazy_load_hooks'

require_relative 'act_as_role/version'
require_relative 'act_as_role/resource'

module ActAsRole
  class Error < StandardError; end

  ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.send :extend, ActAsRole::Resource
  end

end
