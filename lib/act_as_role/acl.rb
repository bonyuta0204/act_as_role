# frozen_string_literal: true

module ActAsRole
  module Acl
    def act_as_acl(**options)
      @resource_klass = options[:resource]
      @actor_klass = options[:actor]

      resource_foreign_key = "#{@resource_klass.to_s.underscore}_id".to_sym
      actor_foreign_key = "#{@actor_klass.to_s.underscore}_id".to_sym

      belongs_to :resource, class_name: @resource_klass, foreign_key: resource_foreign_key
      belongs_to :actor, class_name: @actor_klass, foreign_key: actor_foreign_key

      scope :by_actor_id, ->(id) { where(actor_foreign_key => id) }
    end
  end
end
