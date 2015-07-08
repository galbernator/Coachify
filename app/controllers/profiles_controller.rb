class ProfilesController < ApplicationController

  before_action :get_user, except: [:new, :create]

  def new
    @profile = User.new
  end

  def create
    @profile = User.new(user_params)
    if @profile.save
      session[:user_id] = @profile.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.authenticate(params[:user][:current_password]) && @profile.update(user_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit([:first_name, :last_name, :email, :password, :password_confirmation, :avatar])
  end

  def get_user
    @profile = current_user
  end

end
