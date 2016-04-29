class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :follows, through: :user_follows
	has_many :followers, through: :user_follows

	def full_name
		firstname + " " + lastname
	end
end

class Post < ActiveRecord::Base
	belongs_to :user
	has_many :post_tags
	has_many :tags, through: :post_tags
	has_many :comments, through: :user_comments
end

class Tag < ActiveRecord::Base
	has_many :post_tags
	has_many :posts, through: :post_tags
end

class PostTag < ActiveRecord::Base
	belongs_to :post
	belongs_to :tag
end

class UserFollow < ActiveRecord::Base
	belongs_to :follower
	belongs_to :followee
end

class PostComment < ActiveRecord::Base
	belongs_to :post
	belongs_to :comment
end