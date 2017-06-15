require 'rails_helper'

RSpec.describe TargetKey, type: :model do
  describe "validations" do
    subject { TargetKey.create(project_id: 1, key_id: 1) }

    it { should validate_presence_of(:project_id) }
    it { should validate_presence_of(:key_id) }
    it { should validate_uniqueness_of(:project_id).scoped_to(:key_id) }
  end

  describe "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:key) }
  end
end
