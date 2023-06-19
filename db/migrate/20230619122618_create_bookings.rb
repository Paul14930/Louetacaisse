class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date_debut
      t.date :date_fin
      t.references :user, null: false, foreign_key: true
      t.references :voiture, null: false, foreign_key: true
      t.boolean :valide

      t.timestamps
    end
  end
end
