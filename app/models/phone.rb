class Phone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true
  validates :number, uniqueness: true
  validates :kind, presence: true
  validates :kind, uniqueness: true
  validates :main, presence: true
  validates :main, uniqueness: true
end
