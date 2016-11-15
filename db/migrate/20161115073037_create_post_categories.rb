class CreatePostCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :post_categories do |t|
      t.references :post, foreign_key: true, index:true
      t.references :category, foreign_key: true, index:true

      t.timestamps
    end
  end
end
