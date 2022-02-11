# frozen_string_literal: true

class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  validates_associated :contacts
  validates :name, presence: true, uniqueness: true
end
