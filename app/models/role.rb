class Role < ApplicationRecord
  validates :name, presence: true
  has_many :permission, through: :role_permission
end
