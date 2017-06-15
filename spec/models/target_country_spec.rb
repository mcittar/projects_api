require 'rails_helper'

RSpec.describe TargetCountry, type: :model do

  describe "validations" do
    subject { TargetCountry.create(project_id: 1, country_id: 1) }

    it { should validate_presence_of(:project_id) }
    it { should validate_presence_of(:country_id) }
    it { should validate_uniqueness_of(:project_id).scoped_to(:country_id) }
  end

  describe "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:country) }
  end

end
