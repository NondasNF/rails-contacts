class Contact < ApplicationRecord
  belongs_to :user
  has_many :phones, dependent: :destroy
  validates_associated :phones
  validates :name, presence: true
  validates :name, uniqueness: true
end
