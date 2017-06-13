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

class Project < ApplicationRecord
  validates :project_name, :creation_date, :expiry_date, :enabled,
            :target_countries, :project_cost, :project_url, :target_keys,
            presence: true
end
