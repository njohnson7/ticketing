class User < ApplicationRecord
  has_secure_password    # TODO validations: false

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :name, :email
end
