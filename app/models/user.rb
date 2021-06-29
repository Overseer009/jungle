class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase.strip) 
    user && user.authenticate(password)
  end

end
