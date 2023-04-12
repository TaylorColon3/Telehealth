class UsersController < ApplicationController
  def show 
    url_username = params.fetch("path_username")
  
    matching_usernames = User.where({ :username => url_username })
  
    @the_user = matching_usernames.first
end 
end 
