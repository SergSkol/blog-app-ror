require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 0) }

  before { subject.save }

  it 'Name must not be blank.' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Subject should be valid' do
    expect(subject).to be_valid
  end
end
