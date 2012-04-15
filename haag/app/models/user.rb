class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_and_belongs_to_many :courses
  has_many :tasks
  has_many :messages
  
  has_many :assignments, :through => :tasks
  # required by nested_form
  accepts_nested_attributes_for :assignments
  attr_accessible :assignments_attributes

end
