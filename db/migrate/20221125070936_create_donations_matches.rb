class CreateDonationsMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :donations_matches do |t|
      t.references :donation, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
