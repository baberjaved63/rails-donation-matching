class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :donor_id, null: false, index: true
      t.integer :match_type
      t.integer :status
      t.date :end_date
      t.decimal :pledge_limit
      t.decimal :pledge_fulfilled, default: 0.0
      t.decimal :pledge_amount

      t.timestamps
    end
  end
end
