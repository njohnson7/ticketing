class Tag < ApplicationRecord
  has_many :tag_tickets, dependent: :destroy
  has_many :tickets, through: :tag_tickets

  validates_presence_of :name
  validates :name, format: { with: /\A[^,]*\z/, message: "can't contain commas" }
end
