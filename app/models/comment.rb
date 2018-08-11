class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates_presence_of :body
end
