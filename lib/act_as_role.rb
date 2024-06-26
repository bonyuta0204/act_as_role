# frozen_string_literal: true

require 'act_as_role/version'
require 'active_support/lazy_load_hooks'

require_relative 'act_as_role/version'
require_relative 'act_as_role/resource'
require_relative 'act_as_role/acl'

module ActAsRole
  class Error < StandardError; end

  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.extend ActAsRole::Resource
    ActiveRecord::Base.extend ActAsRole::Acl
  end
end
