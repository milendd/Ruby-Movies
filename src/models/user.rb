require 'digest'

class User < ActiveRecord::Base
  has_many :ratings
  
  def self.authenticate(username, password)
    encrypted = Digest::SHA256.hexdigest(password)
    User.where(username: username, encrypted_password: encrypted).first
  end
  
  def self.register(params)
    encrypted = Digest::SHA256.hexdigest(params[:password])
    User.create(username: params[:username],
      email: params[:email],
      encrypted_password: encrypted,
      is_admin: false
    )
  end
end
