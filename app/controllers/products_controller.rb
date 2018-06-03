class ProductsController < ApplicationController

   def index
    @products =  Product.order(:products_code)
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv, filename: "Master-CSV-#{Date.today}.csv" }
      format.xls #{ send_data @products.to_csv(col_sep: "\t"), filename: "Master-CSV-#{Date.today}.xls" }
    end
  end
  


  def import
    file = params[:file]
      spreadsheet = Roo::Spreadsheet.open(file)

      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
         next unless spreadsheet.row(i)[0]
         row = Hash[[header, spreadsheet.row(i)].transpose]
         row.default = ""

      b = row["Color"]
      c = row["story_code"]
      d = row["Fabric"]
      e = row["Washcare"]
      f = row["neck"]
      g = row["Sleeves"]
      h = row["Title"]
      j = row["Stylist Says"]
      l = row["Brand"]
      m = row["Item Category"]
      o = row["products_length"]
      z = row["MRP"]
      q = row["Item tax Group"]
      r = row["Size Description"]
      s = row["Variant"]
      t = row["product_team"]
      u = row["Posting Date"]
      v = row["archived"]
      if row.key?("SKU")
        a = row["SKU"]
      # row.key?("Item No")
     else
        a = row["Item No"]
      end
      # a = row["SKU"] || row["Item No"]
      if row.key?("Desc")
        i = row["Desc"]
      else
        i = row["Description"]
       end
 
      if row.key?("Season_code")
        k = row["Season_code"] 
      else
        k = row["Season"]
       end

      if row.key?("Product Group")
        n = row["Product Group"]  
      else
        n = row["Cat"]
      end
# binding.pry
    # if Product.exists?(products_code: a)
   
    #     @import = Product.attributes(products_code: a , added_date: u ,  mrp: z ,  brands_code: l , categories_code: m , group_code: n ,
    #      seasons_code: k , story_code: c ,  products_title: h ,  products_descriptiont: i , products_color: b , products_fabric: d ,
    #       products_washcare: e , products_sleev: g ,  products_neck: f , products_length: o , stylist_says: j , tax_percent: q , 
    #       product_sizes: r , product_varients: s , product_team: t , archived: v )

    #   else
         # import = Product.where(products_code: a)
         # if import.exists?
         # import.update(products_code: a , added_date: u ,  mrp: z ,  brands_code: l , categories_code: m , group_code: n ,
         # seasons_code: k , story_code: c ,  products_title: h ,  products_descriptiont: i , products_color: b , products_fabric: d ,
         #  products_washcare: e , products_sleev: g ,  products_neck: f , products_length: o , stylist_says: j , tax_percent: q , 
         #  product_sizes: r , product_varients: s , product_team: t , archived: v)

         #  else
          a = Product.new(products_code: a , added_date: u ,  mrp: z ,  brands_code: l , categories_code: m , group_code: n ,
         seasons_code: k , story_code: c ,  products_title: h ,  products_descriptiont: i , products_color: b , products_fabric: d ,
          products_washcare: e , products_sleev: g ,  products_neck: f , products_length: o , stylist_says: j , tax_percent: q , 
          product_sizes: r , product_varients: s , product_team: t , archived: v)
        
          a.save
          # end 
         
      end
      redirect_to root_url, notice: "Imported Successfully" and return
  end
end