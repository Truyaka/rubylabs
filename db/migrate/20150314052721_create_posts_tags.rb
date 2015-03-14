class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
      t.string :post
      t.string :tag
    end
  end
end
