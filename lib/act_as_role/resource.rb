module ActAsRole
  module Resource


    def act_as_role(**options)

      @@acl_klass = options[:acl]
      @@actor_klass = options[:actor]

      has_many :acls, class_name: @@acl_klass
    end

    # Filter the resource by_actor
    def by_actor(actor)
      joins(:acls).where(acls: { actor: actor})
    end

  end
end
