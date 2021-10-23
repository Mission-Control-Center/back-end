class AppRole < ApplicationRecord
  belongs_to :app_config
  belongs_to :role
end
