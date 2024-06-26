# frozen_string_literal: true

class UserPost < ActiveRecord::Base
  act_as_acl resource: 'Post', actor: 'User'
end
