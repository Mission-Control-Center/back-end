class Permission < ApplicationRecord
  validates :name, presence: true
  has_many :role, through: :role_permission
end
