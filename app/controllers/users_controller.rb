class UsersController < ApplicationController

    def index

    end

    def new
      # find a way to determine the company that sent the invite link to the user and getb that value
      # company = Company.find #company.id
      # company = Company.find 1
      @user = User.new
      # @locations = []
      # Company.find(company).locations.each do |store|
      #   @locations << [store.name, store.id]
      # end
    end

    def create
      @user = User.new(user_params)
      @user.company = @user.location.company
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
      @user = current_user
    end

    def update
      @user = current_user
      if @user.authenticate(params[:user][:current_password]) && @user.update(user_params)
        redirect_to root_path
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
      params.require(:user).permit([:first_name, :last_name, :email, :location_id, :password, :password_confirmation, :avatar])
    end

end
