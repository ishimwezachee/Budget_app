require 'rails_helper'

RSpec.describe Category, type: :model do
  @user1 = User.create(name: 'zachee')
  subject do
    Category.new(name: 'g1', icon: 'test.png', user_id: @user1)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'category should belong to user' do
    expect(subject.user_id).to eql(@user1)
  end

  it 'Test instance of Category' do
    expect(subject).to be_instance_of Category
  end
end
