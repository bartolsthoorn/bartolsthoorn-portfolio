class Admin::AuthController < ApplicationController
  before_filter :isadmin?
  
  def isadmin?
    if (!user_signed_in?)
      redirect_to new_user_session_url
    else
      if current_user.id != 1
        redirect_to destroy_user_session_url
      end
    end
  end
end