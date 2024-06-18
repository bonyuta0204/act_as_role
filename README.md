
# ActAsRole

ActAsRole is a Ruby gem that provides a simple and flexible way to manage access control for ActiveRecord models by defining roles and permissions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'act_as_role'
```

And then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install act_as_role
```

## Usage

### Setup Models

First, set up your models to act as actors and resources. Create your User and Post models as follows:

#### `app/models/user.rb`

```ruby
class User < ActiveRecord::Base
  acts_as_actor
end
```

#### `app/models/post.rb`

```ruby
class Post < ActiveRecord::Base
  acts_as_resource acl: 'UserPost', actor: 'User'
end
```

#### `app/models/user_post.rb`

Create a model to represent the access control entries (ACL).

```ruby
class UserPost < ActiveRecord::Base
  act_as_acl resource: 'Post', actor: 'User'
end
```

### Example Usage

#### Grant Permission

```ruby
user = User.create!(username: 'example_user')
post = Post.create!(name: 'example_post')
UserPost.create!(user: user, post: post, permission: :read)

# Get all posts that a user has read permission for
posts = Post.by_actor(user)
```
