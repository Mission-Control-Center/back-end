class AppConfigSerializer < ActiveModel::Serializer
  attributes :id, :version, :app_meta_info, :app_roles
end
