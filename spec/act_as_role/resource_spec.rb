# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ActAsRole::Resource do
  describe 'Act as resource' do
    let!(:post) { Post.create! }
    let!(:user) { User.create! }
    let!(:user_post) { UserPost.create!(post_id: post.id, user_id: user.id) }

    it 'has acls associations' do
      expect(post.acls).to include(user_post)
    end

    it 'can be filtered by actor' do
      result = Post.by_actor(user)
      expect(result).to be_a(ActiveRecord::Relation)
      expect(result.size).to eq(1)
      expect(result.first).to eq(post)
    end
  end
end
