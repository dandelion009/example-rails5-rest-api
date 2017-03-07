class Consumer < ApplicationRecord
  has_many :affinity_groups
  has_many :brand_affinities, through: :affinity_groups, source: :brand

  validates_presence_of :name
end
