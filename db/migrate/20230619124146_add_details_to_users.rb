class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :adresse, :text
    add_column :users, :ville, :string
    add_column :users, :code_postal, :string
    add_column :users, :photo_de_profil, :string
  end
end
