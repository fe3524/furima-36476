class AddColumnItems < ActiveRecord::Migration[6.0]
  def up
    add_column :items, :status, :integer
  end
end
