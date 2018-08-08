class Ticket < ApplicationRecord
  STATUSES = { 'New' => 'new', 'Blocked' => 'blocked', 'In Progress' => 'in_progress', 'Fixed' => 'fixed' }.freeze

  belongs_to :project
  has_many :tag_tickets
  has_many :tags, through: :tag_tickets

  validates_presence_of :name

  def fixed?
    status == 'fixed'
  end
end
