class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def index
    
    @users = User.paginate(page: params[:page]).order("created_at desc")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   
    if @user.save
      # Sends email to user when user is created.
      UserMailer.account_activation(@user).deliver_now
      flash[:success] = "please active account in your mail"
      redirect_to root_path
    else
      render 'new'
      
    end
      #   flash[:success] = "Vao mail de active account"
    #   redirect_to root_path
    # else 
    #   render 'new'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Profile deleted"
    redirect_to users_path
  end
  
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)      
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
