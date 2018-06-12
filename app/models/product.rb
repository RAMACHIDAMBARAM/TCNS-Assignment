class Product < ApplicationRecord

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
  	column_names1 = ["id",
 "products_code",
 "added_date",
 "mrp",
 "brands_code",
 "categories_code",
 "group_code",
 "seasons_code",
 "story_code",
 "products_title",
 "products_descriptiont",
 "products_color",
 "products_fabric",
 "products_washcare",
 "products_sleev",
 "products_neck",
 "products_length",
 "stylist_says",
 "tax_percent",
 "product_sizes",
 "product_varients",
 "product_team",
 "archived"]

    csv << column_names1
    all.each do |product|
      csv << product.attributes.values_at(*column_names1)
    end
  end
end
  
end