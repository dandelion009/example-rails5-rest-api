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

class AffinityGroup < ApplicationRecord
  belongs_to :consumer
  belongs_to :brand

  validates :brand_id, uniqueness: { scope: :consumer_id }

  after_commit :check_for_hook_trigger

  def check_for_hook_trigger
    Hook.trigger_if_threshold_reached_for self.brand_id
  end
end
