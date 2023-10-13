# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it { should validate_presence_of(:email) }

  describe 'validate uniqueness' do
    subject { build(:user, email: 'test@gmail.com') }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  it { should validate_presence_of(:password) }
end
