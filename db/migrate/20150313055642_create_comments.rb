class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :text
      t.string :post_id
      t.integer :author_id
    end
  end
end