require 'rails_helper'

RSpec.describe Permission, type: :model do
  subject do
    described_class.new(name: 'Manage')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
