class FriendshipsController < ApplicationController


  	def create
  		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  		if @friendship.save
    		flash[:notice] = "Added friend."    		
  		else
    		flash[:error] = "Unable to add friend."
  		end
  		redirect_to :controller => "users", :action => "index"
	end

	def destroy
  		@friendship = current_user.friendships.find_by(:friend_id => params[:friend_id])
  		@friendship.destroy
  		flash[:notice] = "Removed friendship."
  		redirect_to :controller => "users", :action => "index"
	end


end
