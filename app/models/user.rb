class User < ApplicationRecord
  attr_reader :password
  validates :username, :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  before_validation :hash_password
  after_validation :create_session_token

  def password=(password)
    @password = password
  end

  private
  def hash_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
end
