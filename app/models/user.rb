class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password_digest, :password, :password_confirmation, :signed_up, :last_sign_in_at

  before_save { |user| user.email = email.downcase if user.email}
  validates :name, presence: true
  validates :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.create_anonymous
    user = User.new name:'Anonymous User', signed_up:false
    user.save(validate:false) # dont validate as we're missing fields
    user
  end
end
