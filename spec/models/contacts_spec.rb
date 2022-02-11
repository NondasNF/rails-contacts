# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  fixtures :contacts
  fixtures :users

  context 'name is not empty' do
    it 'return a count of 3 after saving a new entry in the contact table' do
      Contact.create! name: 'Contact3', user_id: 1
      expect(Contact.all.count).to eq(3)
    end
  end

  context 'name is empty' do
    it 'return a validation error' do
      expect do
        Contact.create! birthday: '2022-02-02', user_id: 1
      end.to raise_error("Validation failed: Name can't be blank")
    end
  end

  context 'name is already in the database' do
    it 'return a validation error' do
      expect do
        Contact.create! name: 'Contact1', user_id: 1
      end.to raise_error('Validation failed: Name has already been taken')
    end
  end

  context 'register a contact to a unexistent user' do
    it 'return a validation error' do
      expect do
        Contact.create! name: 'Contact3', user_id: nil
      end.to raise_error('Validation failed: User must exist')
    end
  end
end
