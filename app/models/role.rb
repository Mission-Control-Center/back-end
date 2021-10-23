class Role < ApplicationRecord
  validates :name, presence: true
  has_many :permissions, through: :role_permission
  has_many :role_permissions
end
