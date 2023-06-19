class CreateVoitures < ActiveRecord::Migration[7.0]
  def change
    create_table :voitures do |t|
      t.string :marque
      t.string :modele
      t.text :description
      t.integer :annee
      t.float :prix
      t.references :user, null: false, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
