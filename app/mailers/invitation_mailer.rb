class InvitationMailer < ApplicationMailer

  def user_invitation(invitation, signup_url)
    @invitation = invitation
    @signup_url = signup_url
    mail(to: invitation.recipient_email, subject: "Your Invitation to Coachify")
  end
end
