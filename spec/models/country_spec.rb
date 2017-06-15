require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:incomplete_country) { Country.new }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    it "validates presence of name" do
      expect(incomplete_country).not_to be_valid
    end
  end

  describe "associations" do
    it { should have_many(:projects).through(:target_countries) }
  end

end
