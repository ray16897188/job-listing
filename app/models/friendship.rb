# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ApplicationRecord

	# 加user_id这一项，因为名字和User这个model相同，所以rails知道这个外键对应User这张表
	belongs_to :user
	# 加friend_id这一列，friend就在这里定义，但是rails不知道friend是什么，所以要告诉他实际上是User
	belongs_to :friend, :class_name => "User"


end
