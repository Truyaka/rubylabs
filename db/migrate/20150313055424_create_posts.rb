class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
	    t.string :author
	    t.string :label
	    t.string :text
    end
  end
end
