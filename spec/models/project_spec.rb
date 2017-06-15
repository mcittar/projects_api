require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:project) { FactoryGirl.create(:project) }

  describe "validations" do
    it { should validate_presence_of(:id) }
    it { should validate_numericality_of(:id).only_integer }
    it { should validate_presence_of(:project_name) }
    it { should validate_presence_of(:creation_date) }
    it { should validate_presence_of(:expiry_date) }
    it { should validate_presence_of(:enabled) }
    it { should validate_presence_of(:project_cost) }
    it { should validate_numericality_of(:project_cost) }
    it { should validate_presence_of(:project_url) }
    it { should validate_uniqueness_of(:id) }
    it { should validate_uniqueness_of(:project_name) }

    describe "creation_date" do
      it "should reject non-date strings" do
        project.creation_date = "BAD STRING"
        expect(project).to_not be_valid
      end
      it "should reject incorrect dates" do
        project.creation_date = "05202017 00:00:00"
        expect(project).to_not be_valid
      end
      it "should accept correctly formatted dates" do
        project.creation_date = DateTime.now
        expect(project).to be_valid
      end
    end

    describe "expiry_date" do
      it "should reject non-date strings" do
        project.expiry_date = "BAD STRING"
        expect(project).to_not be_valid
      end
      it "should reject incorrect dates" do
        project.expiry_date = "05202017 00:00:00"
        expect(project).to_not be_valid
      end
      it "should accept correctly formatted dates" do
        project.expiry_date = DateTime.now
        expect(project).to be_valid
      end
      it "should reject dates prior to creation_date" do
        project.expiry_date = DateTime.now - 1
        expect(project).to_not be_valid
      end
    end
  end
  
  describe "associations" do
    it { should have_many(:countries).through(:target_countries) }
    it { should have_many(:keys).through(:target_keys) }
  end

end
