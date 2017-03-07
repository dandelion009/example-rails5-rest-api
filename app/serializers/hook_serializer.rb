class HookSerializer < ActiveModel::Serializer
  attributes :id, :threshold, :callback
end
