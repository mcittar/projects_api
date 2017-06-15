require 'rails_helper'

RSpec.describe Key, type: :model do
  let!(:key) { FactoryGirl.create(:key) }

  describe "validations" do
    it { should validate_presence_of(:number) }
    it { should validate_uniqueness_of(:number) }
    it { should validate_presence_of(:keyword) }
    it { should validate_uniqueness_of(:keyword) }
  end

  describe "associations" do
    it { should have_many(:projects).through(:target_keys) }
  end

end
