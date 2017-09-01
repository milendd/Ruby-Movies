require 'digest'

class User < ActiveRecord::Base
  has_many :ratings
  
  def self.authenticate(username, password)
    encrypted = self.encrypt(username, password)
    User.where(username: username, encrypted_password: encrypted).first
  end
  
  def self.register(params)
    username = params[:username]
    password = params[:password]
    encrypted = self.encrypt(username, password)
    
    User.create(
      username: username,
      email: params[:email],
      encrypted_password: encrypted,
      is_admin: false
    )
  end
  
  private 
  def self.encrypt(username, password)
    # it is more secure this way
    # in case two users have the same password
    value = "#{username}_#{password}"
    Digest::SHA256.hexdigest(value)
  end
end
