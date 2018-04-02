require 'bcrypt' 
class User < ApplicationRecord
  include BCrypt
  attr_accessor :password,:password_confirmation
  has_one :franchisee, :dependent => :destroy
  has_many :user_roles, :dependent => :destroy

  validates_presence_of :password, :password_confirmation, :allow_blank=>true, :message=> "Required"
  validates :password, :password_confirmation, confirmation: true
  validates_presence_of :email_id
  #validates_uniqueness_of :email_id, :message=>"Already taken"
  validates_format_of :email_id, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :allow_blank => true, :message=> "Invalid"
  #validates_uniqueness_of :email_id  

    before_save :encrypt_password
    def encrypt_password
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

    def self.authenticate(email, password)
      user = find_by(email_id: email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end

end
