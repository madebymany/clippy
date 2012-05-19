class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  extend FriendlyId
  friendly_id :username, use: :slugged

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
  
  has_many :clips, dependent: :destroy
  
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_length_of :username, :within => 3..100, :on => :create, :message => "must be present"
  validates_format_of :username, :with => /^[A-Za-z\d_\-\0..9]+$/, :message => "can only contain characters, numbers and _'s"
  
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Clip.where("user_id = ?", id)
  end
  
end
