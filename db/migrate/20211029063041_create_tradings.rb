class CreateTradings < ActiveRecord::Migration[6.0]
  def change
    create_table :tradings do |t|
      t.references :history,      null: false, foreign_key: true
      t.string     :zipcode,      null: false
      t.integer    :state_id,     null: false
      t.string     :city,         null: false
      t.string     :address,      null: false
      t.string     :building
      t.string     :phone_number, null: false
      t.timestamps
    end
  end
end
