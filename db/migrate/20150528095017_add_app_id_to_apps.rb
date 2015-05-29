class AddAppIdToApps < ActiveRecord::Migration
  def change
    add_column :apps, :app_id, :string
    add_index :apps, :app_id
  end
end
