class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :password, :password_confirmation, :email, :first_name, :last_name

  validates :email, uniqueness: {case_sensitive: false}

  validates :password, confirmation: true, length: {minimum: 2}

  def self.authenticate_with_credentials(email, password)
    User.find_by(email: email).try(:authenticate, password)
  end
end
