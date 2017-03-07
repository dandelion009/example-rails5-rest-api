class BrandSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :links

  def links
    {
      self: brand_path(object.id),
      followers: brand_followers_path(object.id)
    }
  end
end
