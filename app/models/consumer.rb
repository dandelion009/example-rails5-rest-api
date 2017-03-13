# == Schema Information
#
# Table name: consumers
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Consumer < ApplicationRecord
  has_many :affinity_groups
  has_many :brand_affinities, through: :affinity_groups, source: :brand

  validates_presence_of :name
end
