class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    User.where('lower(email) = ?', email.strip.downcase).first.try(:authenticate, password) || nil
    # User.find_by(email: email.strip.downcase).try(:authenticate, password) || nil
  end

end
