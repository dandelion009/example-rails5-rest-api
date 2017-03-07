class ConsumerSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :links

  def links
    {
      self: consumer_path(object.id),
      brand_affinities: consumer_brand_affinities_path(object.id)
    }
  end
end
