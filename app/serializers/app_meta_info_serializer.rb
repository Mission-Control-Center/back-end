class AppMetaInfoSerializer < ActiveModel::Serializer
  attributes :id, :owner, :manager
end
