class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    # binding.pry 
    
    end
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   
    if @user.save
      flash[:success] = "Tao thanh cong"
      redirect_to user_path(@user)
    else 
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)      
    end

  
  # def show
  #   @user = User.find(params[:id])
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params) # Not the final implementation!
  #   if @user.save
  #     flash[:success] = "Tao thanh cong"

  #     redirect_to user_path(@user)
  #   else
  #     render 'new'
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end
end
