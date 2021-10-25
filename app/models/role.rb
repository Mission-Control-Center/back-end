class Role < ApplicationRecord
  validates :name, presence: true
  
  has_many :role_permissions, dependent: :destroy
  has_many :permissions, through: :role_permission

  has_many :app_roles, dependent: :destroy
  has_many :app_config, through: :app_roles
end
