class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :owner_infos, class_name: 'AppMetaInfo', foreign_key: 'owner_id'
  has_many :manager_infos, class_name: 'AppMetaInfo', foreign_key: 'manager_id'
end
