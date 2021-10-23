class CreateAppConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :app_configs do |t|
      t.string :version
      t.boolean :is_deleted
      
      t.timestamps
    end
  end
end
