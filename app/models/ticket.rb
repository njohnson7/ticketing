class Ticket < ApplicationRecord
  STATUSES = %w[new blocked in_progress fixed].freeze

  belongs_to :project
  has_many :tag_tickets
  has_many :tags, through: :tag_tickets

  validates_presence_of :name

  def fixed?
    status == 'fixed'
  end
end
