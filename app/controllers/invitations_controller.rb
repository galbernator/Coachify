class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    invitation_params = params.require(:invitation).permit([:recipient_email, :role_id, :token])
    @invitation = Invitation.new(invitation_params)
    @invitation.sender = current_user
    company = @invitation.sender.company
    if @invitation.save
      InvitationMailer.user_invitation(@invitation, signup_url(@invitation.token)).deliver
      redirect_to (:back), message: "Invitation sent"
    else
      debugger
      redirect_to (:back), alert: "Invitation not sent"
    end
  end

end
