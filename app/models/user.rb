require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :event_registrations

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def self.generate_password(email)
    Digest::SHA1.hexdigest email
  end

  def is_admin?
    is_admin
  end
                              
  def is_member?
    is_member
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
