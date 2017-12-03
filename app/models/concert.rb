class Concert < ApplicationRecord

  after_create :send_email

  def send_email

  end
end
