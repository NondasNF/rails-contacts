# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  has_many :phones, dependent: :destroy
  validates_associated :phones
  validates :name, presence: true, uniqueness: { scope: :user_id }
end
