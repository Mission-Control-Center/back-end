class CreateAppMetaInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :app_meta_infos do |t|
      t.references :owner, null: false
      t.references :manager, null: false
      t.string :name

      t.timestamps
    end
    add_foreign_key :app_meta_infos, :users, column: :owner_id
    add_foreign_key :app_meta_infos, :users, column: :manager_id
  end
end
