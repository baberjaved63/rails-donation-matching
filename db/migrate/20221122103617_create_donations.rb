class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.integer :donor_id, null: false, index: true
      t.decimal :amount

      t.timestamps
    end
  end
end
