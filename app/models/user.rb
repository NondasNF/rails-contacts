class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  validates_associated :contacts
  validates :name, presence: true
  validates :name, uniqueness: true
end
