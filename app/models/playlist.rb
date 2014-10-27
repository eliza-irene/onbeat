class Playlist < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
