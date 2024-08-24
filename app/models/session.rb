class Session < ApplicationRecord

  belongs_to :user
  def self.create_user_session(user)
    session_token = SecureRandom.urlsafe_base64
    session = Session.new(user_id: user.id, session_token: session_token)
    session.save
    session_token
  end
end
