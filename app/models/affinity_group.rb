class AffinityGroup < ApplicationRecord
  belongs_to :consumer
  belongs_to :brand

  validates :brand_id, uniqueness: { scope: :consumer_id }

  after_commit :check_for_hook_trigger

  def check_for_hook_trigger
    Hook.trigger_if_threshold_reached_for self.brand_id
  end
end
