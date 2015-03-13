class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :city
      t.string :adress
      t.string :birth
    end
  end
end
