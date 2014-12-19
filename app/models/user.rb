class User < ActiveRecord::Base

  has_many :stories
  has_many :nodes  
  validates_uniqueness_of :username
  validates :username, :length => {:minimum => 1, :messsage => "You must enter a valid login of at least one character."}
  validates :password, :confirmation =>true
  validates :first_name, :presence => true
  validates :last_name, :presence => true



  def password
  	return @password
  end

  def password=(pass)
  	@password = pass
  	salt =  SecureRandom.urlsafe_base64.to_s
  	self.salt = salt
  	pass_plus_salt = pass + salt
  	hashed_pass = Digest::SHA1.hexdigest(pass_plus_salt)
  	self.password_digest = hashed_pass
  end

  def password_valid?(pass)
  	pass_plus_salt = pass + self.salt
  	hashed_pass = Digest::SHA1.hexdigest(pass_plus_salt)
  	if hashed_pass == self.password_digest
  		return true
  	else
  		return false
  	end
  end

end
