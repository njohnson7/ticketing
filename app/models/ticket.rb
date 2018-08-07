class Ticket < ApplicationRecord
  STATUSES = %w[new blocked in_progress fixed].freeze

  belongs_to :project

  validates_presence_of :name

  def fixed?
    status == 'fixed'
  end
end
