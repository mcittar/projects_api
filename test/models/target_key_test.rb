# == Schema Information
#
# Table name: target_keys
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  key_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TargetKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
