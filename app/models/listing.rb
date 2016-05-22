class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.send_status_email
    UserNotifier.status_email.deliver
  end
end
