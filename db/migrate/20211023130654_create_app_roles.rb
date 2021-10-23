class CreateAppRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :app_roles do |t|
      t.references :app_config, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
