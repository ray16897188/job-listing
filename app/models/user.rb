# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # 我的好友列表里都有谁       
  has_many :friendships           
  # 如何获得user.friends? 返回friendships中的（有个隐含设定：要从user_id是当前user.id的items里面找）friend_id这一列“外键”所指向的内容
  has_many :friends, :through => :friendships, :source => :friend

  # 我在谁的好友列表里
  # 如何获得user.inverse_friendships？(class_name和foreign_key是self join查询所对应的解法)
  # 从Friendship表的foreign_key = friend_id = user.id的items中
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  # 如何获得user.inverse_friends？通过上面的inverse_friendships，从user_id这个column对应的外键去找对应的user
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  # through可以是通过items，也可以是表



  def admin?
  	is_admin
  end
  
  def to_admin
  	self.is_admin = true
  	save
  end

  def to_user
  	self.is_admin = false
  	save
  end


end
