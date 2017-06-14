# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :target_countries
  has_many :projects,
           through: :target_countries,
           source: :project
end
