# == Schema Information
#
# Table name: target_countries
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  country_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TargetCountry < ApplicationRecord
  validates :project_id, :country_id, presence: true
  validates :project_id, uniqueness: { scope: :country_id }

  belongs_to :project
  belongs_to :country
end
