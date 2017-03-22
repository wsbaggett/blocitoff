require 'rails_helper'

RSpec.describe Item, type: :model do

 let(:user) do
    User.create!(
      email: "user@bloccit.com",
      password: "helloworld",
      password_confirmation: "helloworld",
      confirmed_at: Date.today
    )
  end

  let(:item) do
    Item.create!(name: 'Item Name',
      user: user)
  end

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_length_of(:name).is_at_least(3) }

  describe "attributes" do
    it "has a name attribute" do
      expect(item).to have_attributes(name: "Item Name")
    end
  end
end
