class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
  def logged_in_user
    unless

      flash[:danger] = "please log in."

    end
  end
end
