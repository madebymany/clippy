class Clip < ActiveRecord::Base
  attr_accessible :content, :url
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true
  validates :url, presence: true
  
  default_scope order: 'clips.created_at DESC'
end
