require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { described_class.new(title: 'test', description: 'test description') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a title longer than 200 characters' do
    subject.title = 'a' * 201
    expect(subject).to_not be_valid
  end

  it 'is not valid with a title shorter than 3 characters' do
    subject.title = 'a' * 2
    expect(subject).to_not be_valid
  end

  it 'is not valid with a description shorter than 3 characters' do
    subject.description = 'a' * 2
    expect(subject).to_not be_valid
  end

  it 'is not valid with a title that is not a string' do
    subject.title = 1
    expect(subject).to_not be_valid
  end

  it 'is not valid with a description that is not a string' do
    subject.description = 1
    expect(subject).to_not be_valid
  end
end
