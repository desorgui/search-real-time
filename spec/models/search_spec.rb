require 'rails_helper'

RSpec.describe Search, type: :model do
  subject { described_class.new(search_query: 'test', user_ip: '10.220.164.202') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a search_query' do
    subject.search_query = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user_ip' do
    subject.user_ip = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a search_query longer than 100 characters' do
    subject.search_query = 'a' * 101
    expect(subject).to_not be_valid
  end

  it 'is not valid with a user_ip longer than 15 characters' do
    subject.user_ip = 'a' * 16
    expect(subject).to_not be_valid
  end

  it 'is not valid with a search_query shorter than 3 characters' do
    subject.search_query = 'a' * 2
    expect(subject).to_not be_valid
  end

  it 'is not valid with a user_ip shorter than 7 characters' do
    subject.user_ip = 'a' * 6
    expect(subject).to_not be_valid
  end

  it 'is not valid with a search_query that is not a string' do
    subject.search_query = 1
    expect(subject).to_not be_valid
  end

  it 'is not valid with a user_ip that is not a string' do
    subject.user_ip = 1
    expect(subject).to_not be_valid
  end
end
