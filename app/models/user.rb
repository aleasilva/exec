class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :trackable, :validatable, :registerable
  
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :rules
end
