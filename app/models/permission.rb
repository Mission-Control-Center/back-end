class Permission < ApplicationRecord
  validates :name, presence: true
  has_many :roles, through: :role_permission
  has_many :role_permissions, dependent: :destroy
end
