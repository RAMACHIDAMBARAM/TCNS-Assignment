class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    	 t.text :products_code
    	 t.text :added_date
    	 t.text :mrp
    	 t.text :brands_code
    	 t.text :categories_code
    	 t.text :group_code
    	 t.text :seasons_code
    	 t.text :story_code
    	 t.text :products_title
    	 t.text :products_descriptiont
    	 t.text :products_color
    	 t.text :products_fabric
    	 t.text :products_washcare
    	 t.text :products_sleev
    	 t.text :products_neck
    	 t.text :products_length
    	 t.text :stylist_says
    	 t.text :tax_percent
    	 t.text :product_sizes
    	 t.text :product_varients
    	 t.text :product_team
    	 t.text :archived
    	 t.timestamps
    end
  end
end
