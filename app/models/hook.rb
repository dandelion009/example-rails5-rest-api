class Hook < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :threshold, presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validates :callback, presence: true, url: true

  # Ideally, this would be able to handle more conditions
  # than just meeting/exceeding a threshold. Having more
  # than one hook defined is pretty useless without that.

  def execute_callback brand
    payload = {
      name: brand.name,
      id: brand.id,
      followers_count: brand.followers.count,
      link: brand_path(brand.id)
    }

    logger.info "WEBHOOK: Contacting #{callback} with payload #{payload}"
  end

  def self.trigger_if_threshold_reached_for brand_id
    brand = Brand.eager_load(:followers).where(id: brand_id).first
    Hook.where('threshold >= ?', brand.followers.count).each do |hook|
      hook.execute_callback brand
    end
  end
end
