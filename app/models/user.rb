class User < ApplicationRecord
  has_many :tickets
  has_many :assignments, class_name: 'Ticket', foreign_key: 'assignee_id'

  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
  validates :email, format: { with: /\A.+@.+\..+\z/ }
end
