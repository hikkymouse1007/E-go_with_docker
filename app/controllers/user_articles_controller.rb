class UserArticlesController < ApplicationController
	 before_action :logged_in_user, only: [:index,:show]
	 before_action :correct_user,   only: [:index,:show]
   def index

   end

   def show

   end
end
