# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  project_name  :string           not null
#  creation_date :datetime         not null
#  expiry_date   :datetime         not null
#  enabled       :boolean          not null
#  project_cost  :float            not null
#  project_url   :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
