class AppConfigSerializer < ActiveModel::Serializer
  attributes :id, :version, :is_deleted, :app_meta_info, :app_roles
end
