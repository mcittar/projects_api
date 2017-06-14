# == Schema Information
#
# Table name: keys
#
#  id         :integer          not null, primary key
#  keyword    :string           not null
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Key < ApplicationRecord
  validates :number, :keyword, presence: true, uniqueness: true
  has_many :target_keys
  has_many :projects,
           through: :target_keys,
           source: :project
end
