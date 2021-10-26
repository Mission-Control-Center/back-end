class AppMetaInfo < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :manager, class_name: 'User'
  belongs_to :app_config, dependent: :destroy
  
  validates :name, presence: true
end
