class Brand < ApplicationRecord
  has_many :affinity_groups
  has_many :followers, through: :affinity_groups, source: :consumer

  validates_presence_of :name
end
