# frozen_string_literal: true

class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :number, null: false
      t.string :kind, null: false
      t.boolean :main, null: false
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
