class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 6}

  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    
    email = email.strip.downcase
    @user = self.find_by('email ILIKE ?', email)

    if @user && @user.authenticate(password)
      return @user
    else
      return 
    end

  end
end
