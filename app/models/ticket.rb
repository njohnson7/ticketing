class Ticket < ApplicationRecord
  STATUSES = { 'New' => 'new', 'Blocked' => 'blocked', 'In Progress' => 'in_progress', 'Fixed' => 'fixed' }.freeze

  belongs_to :project
  has_many :tag_tickets
  has_many :tags, through: :tag_tickets
  belongs_to :creator,  class_name: 'User', foreign_key: 'user_id'
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', optional: true
  has_many :comments

  validates_presence_of :name

  def fixed?
    status == 'fixed'
  end

  def comments?
    !comments.empty?
  end
end
