class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #我的好友列表里都有谁       
  has_many :friendships                          
  has_many :friends, :through => :friendships#, :source => :user

  #我在谁的好友列表里
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user




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
