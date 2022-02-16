# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: { scope: :contact_id }
  validates :main, uniqueness: {
    scope: :contact_id,
    message: 'The contact already has a main number',
    conditions: -> { where(main: true) }
  }
  validates :kind, presence: true
  validates :kind, inclusion: { in: %w[house work other] }
end
