class AddColumnItems < ActiveRecord::Migration[6.0]
  def up
    add_column :items, :status_id, :integer
  end
end
