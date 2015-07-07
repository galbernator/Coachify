class UsersController < ApplicationController

    def index

    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render :new
      end
    end

    def show
      @user = current_user
    end

    def edit
      @user = User.find current_user
    end

    def update
      @user = current_user
      if @user.authenticate(params[:user][:current_password]) && @user.update(user_params)
        redirect_to users_path
      else
        render :edit
      end
    end

    def destroy
      @user = User.find params[:id]
      @user.destroy
      redirect_to root_path
    end

    private

    def user_params
      params.require(:user).permit([:first_name, :last_name, :email, :password, :password_confirmation, :avatar])
    end

end
