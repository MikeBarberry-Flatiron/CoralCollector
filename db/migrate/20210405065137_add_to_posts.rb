class AddToPosts < ActiveRecord::Migration[5.2]
  def change 
    add_column :posts, :post_img, :string
    add_column :posts, :post_desc, :string
  end
end
