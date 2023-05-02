class UsersController < ApplicationController
    def index
      @users = User.all
    end
    def show
      @user= current_user
     
    end
   
      def edit
      @user = User.find(params[:id])
      render :edit
    end
  
    def update
      @user = User.find(params[:id])
      binding.pry
      if @user.update(user_params)
        redirect_to user_path, notice: 'プロフィールを更新しました'
      else
        render :edit
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :profile, :avatar)
    end
  end
