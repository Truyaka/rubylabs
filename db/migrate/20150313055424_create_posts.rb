class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
	    t.string :author
	    t.string :label
	    t.string :text
	    t.string :tag
    end
  end
end