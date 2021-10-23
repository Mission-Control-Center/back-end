class AppConfig < ApplicationRecord
  attribute :version, :string, default: '1.0'
  attribute :is_deleted, :boolean, default: false
  validates :version, presence: true

  has_one :app_meta_info
  
  has_many :app_roles
  has_many :roles, through: :app_roles
end
