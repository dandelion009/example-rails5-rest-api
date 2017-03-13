# == Schema Information
#
# Table name: brands
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Brand < ApplicationRecord
  has_many :affinity_groups
  has_many :followers, through: :affinity_groups, source: :consumer

  validates_presence_of :name
end
