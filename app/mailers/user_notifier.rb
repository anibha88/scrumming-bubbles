class UserNotifier < ApplicationMailer
  default from: "from@example.com"

  def sample_email(user, listing)
    @user = user
    @listing = listing
    mail(to: @user.email, subject: 'Sample Email')
  end

  def status_email
    mail(to: 'nithin@cognitiveclouds.com', subject: 'Sample Status Email')
  end
end
