# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Phone, type: :model do
  fixtures :phones
  fixtures :contacts
  fixtures :users

  context 'number is not empty' do
    it 'return a count of 3 after saving a new entry in the Phone table' do
      Phone.create! number: '8005003', kind: 'house', main: false, contact_id: 1
      expect(Phone.all.count).to eq(3)
    end
  end

  context 'number is empty' do
    it 'return a validation error' do
      expect do
        Phone.create! kind: 'other', main: false, contact_id: 1
      end.to raise_error("Validation failed: Number can't be blank")
    end
  end

  context 'number is already in the contact database' do
    it 'return a validation error' do
      expect do
        Phone.create! number: '8005001', kind: 'other', main: false, contact_id: 1
      end.to raise_error('Validation failed: Number has already been taken')
    end
  end

  context 'register a Phone to a unexistent contact' do
    it 'return a validation error' do
      expect do
        Phone.create! number: '8005004', kind: 'other', main: false, contact_id: nil
      end.to raise_error('Validation failed: Contact must exist')
    end
  end

  context 'register a Phone with an invalid or blank kind' do
    it 'return a validation error' do
      expect do
        Phone.create! number: '8005005', kind: nil, main: false, contact_id: 1
      end.to raise_error("Validation failed: Kind can't be blank, Kind can't be different from 'house', 'work' and 'other'.")
    end
  end

  context 'already has a main number in the contact database' do
    it 'return a validation error' do
      expect do
        Phone.create! number: '8005007', kind: 'other', main: true, contact_id: 1
        Phone.create! number: '8005006', kind: 'other', main: true, contact_id: 1
      end.to raise_error('Validation failed: Main The contact already has a main number')
    end
  end
end
