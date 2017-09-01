require 'digest'

class User < ActiveRecord::Base
  has_many :ratings
  
  def self.authenticate(username, password)
    encrypted = Digest::SHA256.hexdigest(password)
    User.where(username: username, encrypted_password: encrypted).first
  end
end
