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

class TargetKey < ApplicationRecord
  validates :project_id, :key_id, presence: true
  validates_uniqueness_of :project_id, scope: :key_id

  belongs_to :project
  belongs_to :key
end
