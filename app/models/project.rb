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
            :project_cost, :project_url, presence: true

  validates :project_name, uniqueness: true

  validates :creation_date, date: true

  validates :expiry_date, date: { after: :creation_date }

  validates :project_cost, numericality: true

  validates :enabled, inclusion: {
    in: [ true, false ],
    message: "Value must be a boolean"
  }

  has_many :target_countries
  has_many :countries,
           through: :target_countries,
           source: :country

  has_many :target_keys
  has_many :keys,
           through: :target_keys,
           source: :key
end
