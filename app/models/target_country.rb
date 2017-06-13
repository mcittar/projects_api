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
end
