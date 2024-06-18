ActiveRecord::Schema.define do
    create_table :users, force: true do |t|
      t.string :username
    end

    create_table :posts, force: true do |t|
      t.string :name
    end

    create_table :access_control_entries, force: true do |t|
      t.references :actor, polymorphic: true, null: false
      t.references :resource, polymorphic: true, null: false
      t.integer :permission, null: false
      t.timestamps
    end
  end
