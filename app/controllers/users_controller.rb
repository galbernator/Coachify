class UsersController < ApplicationController

    def index

    end

    def new
      invitation = Invitation.find_by_token(params[:token])
      invitation.company.present? ? company = invitation.company : company = invitation.sender.company
      @user = User.new(email: invitation.recipient_email)
      @locations = Location.where(company_id: company.id).map { |store| [store.name, store.id] }
    end

    def create
      invitation = Invitation.where(recipient_email: params[:user][:email], token: params[:token]).first

      if invitation.present?
        @user = User.new(user_params)
        @user.invitation = invitation
        @user.role = invitation.role
        @user.company = invitation.company
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_path
        else
          render :new
        end
      else
        raise
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
      params.require(:user).permit([:first_name, :last_name, :email, :location_id, :password, :password_confirmation, :avatar, :invitation_token])
    end

end
