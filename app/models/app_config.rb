class AppConfig < ApplicationRecord
  attribute :version, :string, default: '1.0.0'
  attribute :is_deleted, :boolean, default: false
  validates :version, presence: true

  has_one :child, class_name: 'AppConfig', foreign_key: 'parent_id', inverse_of: :parent
  belongs_to :parent, class_name: 'AppConfig', optional: true, inverse_of: :child 

  has_one :app_meta_info

  has_many :app_roles
  has_many :roles, through: :app_roles
  
  def most_recent?
    child.nil?
  end

  def leaf
    return self if child.nil?

    child.leaf
  end

  def root
    return self if parent.nil?

    parent.root
  end
end
