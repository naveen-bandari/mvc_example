class Article < ApplicationRecord

	def total_likes(user_id)
		Article.count
	end
end
