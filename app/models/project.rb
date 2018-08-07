class Project < ApplicationRecord
  has_many :tickets

  validates_presence_of :name

  def total_tickets
    tickets.size
  end

  def fixed_tickets
    tickets.count &:fixed?
  end

  def open_tickets
    total_tickets - fixed_tickets
  end
end
