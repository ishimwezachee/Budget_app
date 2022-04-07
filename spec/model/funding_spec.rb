require 'rails_helper'

RSpec.describe Funding, type: :model do
  first_user =  User.new(name: 'user_name', id:1, email:'user_name@gmail.com',password:'123456')
  category = Category.create(id:1,name:"category1",icon:'icon1',user_id:first_user)
  subject do
    Funding.create(name:"funding1",amount:40,user_id:first_user,category_id:category)
  end

  before { subject.save }

  it "name should be preset" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "amount should be preset" do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Funding should belong to first_user' do
    expect(subject.user_id).to_not eql(first_user)
  end

  it 'Funding should belong to Category' do
    expect(subject.category_id).to_not eql(category)
  end

  it "Funding amounnt should be a number" do
  expect(subject.amount).to eq(40) 
  end
end
