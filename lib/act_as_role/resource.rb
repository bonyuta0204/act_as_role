# frozen_string_literal: true

module ActAsRole
  module Resource
    def act_as_role(**options)
      @acl_klass_name = options[:acl]
      @actor_klass_name = options[:actor]

      extend(ClassMethods)

      has_many :acls, class_name: @acl_klass_name

      scope :by_actor_id, lambda { |actor_id|
                            joins(:acls).merge(ack_klass.by_actor_id(actor_id))
                          }
    end

    # Filter the resource by_actor
    module ClassMethods
      def by_actor(actor)
        joins(:acls).where(acls: { actor: actor })
      end

      def ack_klass
        @acl_klass_name.constantize
      end
    end
  end
end
