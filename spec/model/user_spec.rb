require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Created user' do
    subject { User.new(name: 'user_name', id: 1, email: 'user_name@gmail.com', password: '123456') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should be present' do
      subject.name = 'user_name'
      expect(subject).to be_valid
    end
    it 'email should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'password should not be present' do
      subject.password = nil
      expect(subject).to be_valid
    end
  end
end
