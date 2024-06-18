# frozen_string_literal: true

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :username
  end

  create_table :posts, force: true do |t|
    t.string :name
  end

  create_table :user_posts, force: true do |t|
    t.integer :user_id
    t.integer :post_id
    t.integer :policy_level
  end
end
