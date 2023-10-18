# spec/models/group_spec.rb

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = create(:user)
      group = build(:group, user:)

      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      user = create(:user)
      group = build(:group, name: nil, user:)
      expect(group).not_to be_valid
    end

    it 'is not valid without an icon' do
      user = create(:user)
      group = build(:group, icon: nil, user:)
      expect(group).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many group expenses' do
      association = described_class.reflect_on_association(:group_expenses)
      expect(association.macro).to eq :has_many
    end

    it 'has many expenses through group expenses' do
      association = described_class.reflect_on_association(:expenses)
      expect(association.macro).to eq :has_many
      expect(association.options[:through]).to eq :group_expenses
    end
  end
end
