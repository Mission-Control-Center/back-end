class CreateAppConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :app_configs do |t|
      t.string :version
      t.boolean :is_deleted
      t.references :parent, foreign_key: { to_table: :app_configs }
    
      t.timestamps
    end
  end
end
