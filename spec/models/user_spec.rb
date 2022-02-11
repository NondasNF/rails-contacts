require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  context 'name is not empty' do
    it 'will save a new user and it will be a total of 3 in the database' do
      User.create! name: "User3", age: 1, bio: "Anything1"
      expect(User.all.count).to eq(3)
    end
  end

  context 'name is empty' do
    it 'return a validation error' do
      expect { 
        User.create! bio: "Anything2" 
      }.to raise_error("Validation failed: Name can't be blank")
    end
  end

  context 'name is already in the database' do
    it 'return a validation error' do
      expect { 
        User.create! name: "User1" 
      }.to raise_error("Validation failed: Name has already been taken")
    end
  end

end
