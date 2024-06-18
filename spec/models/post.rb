# frozen_string_literal: true

class Post < ActiveRecord::Base
  act_as_role acl: 'UserPost', actor: 'User'
end
