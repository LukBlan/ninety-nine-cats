class User < ApplicationRecord
  attr_reader :password
  validates :username, :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  before_validation :hash_password

  has_many :sessions
  has_many :cats
  has_many :cat_rental_requests, foreign_key: :requester_id, class_name: "CatRentalRequest"

  def self.find_by_session_token(session_token)
    users = User.joins(:sessions).where(sessions: {session_token: session_token})

    if users.empty?
      nil
    else
      users[0]
    end
  end

  def password=(password)
    @password = password
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?

    return user if user.valid_password?(user.password_digest, password)
    nil
  end


  def valid_password?(stored_hash, password)
    BCrypt::Password.new(stored_hash).is_password?(password)
  end

  private
  def hash_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
end
