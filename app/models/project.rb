class Project < ApplicationRecord
  validates :project_name, :creation_date, :expiry_date, :enabled,
            :target_countries, :project_cost, :project_url, :target_keys
end
