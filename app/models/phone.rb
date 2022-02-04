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
  validate :kind_must_be_equal_to_preset

  def kind_must_be_equal_to_preset
    return unless kind != 'house' && kind != 'work' && kind != 'other'

    errors.add(:kind, "can't be different from 'house', 'work' and 'other'.")
  end
end
