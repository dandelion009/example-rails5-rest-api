# == Schema Information
#
# Table name: affinity_groups
#
#  id          :uuid             not null, primary key
#  consumer_id :uuid
#  brand_id    :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_affinity_groups_on_consumer_id_and_brand_id  (consumer_id,brand_id)
#

require 'test_helper'

class AffinityGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
