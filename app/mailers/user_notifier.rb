class UserNotifier < ApplicationMailer
  add_template_helper(ListingsHelper)
  default from: "from@example.com"

  def sample_email(user, listing)
    @user = user
    @listing = listing
    mail(to: @user.email, subject: 'Sample Email')
  end

  def status_email(tenant, project)
    @tenant = tenant
    @project = project
    mail(to: 'nithin@cognitiveclouds.com', subject: 'Sample Status Email')
  end
end
