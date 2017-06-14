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
  validates :id, :project_name, :creation_date, :expiry_date, :enabled,
            :project_cost, :project_url, presence: true

  validates :id, :project_name, uniqueness: true

  validates :creation_date, date: true

  validates :expiry_date, date: { after: :creation_date }

  validates :project_cost, numericality: true

  validates :id, numericality: { only_integer: true }

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

  # Per instructions, always returns project with matching id even other
  # params do not match. Search conditionally adds addition SQL queries
  # if the params exist within the request
  def self.search(params)
    eligible = self.joins(:countries, :keys).distinct
      .where("expiry_date < ? AND enabled = true", DateTime.now)
    if params[:projectid]
      return eligible.where(id: params[:projectid])
    else
      if params[:country]
        eligible = eligible.where("countries.name = ?", params[:country].upcase)
      end
      if params[:number]
        eligible = eligible.where("keys.number = ?", params[:number].to_i)
      end
      if params[:keyword]
        eligible = eligible.where("keys.keyword = ?", params[:keyword].downcase)
      end
    end

    eligible.order(project_cost: :desc)

  end

end
