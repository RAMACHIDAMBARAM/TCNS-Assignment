class TestController < ApplicationController

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
    file_name = file.original_filename
    binding.pry
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
      z = row["Unit Price"]

   

 # binding.pry
      # q = row["Item tax Group"]
      r = row["Variant Code"]
      s = row["Product variants"]
      t = row["product_team"]
      u = row["Added Date"]
      v = 0
    if row.key?("SKU")
      a = row["SKU"]
      x = ""
      q = ""
    else
      a = ""
      x = row["Item No"]
      if (z <= 1050.0)
        q = 0.05
      else
        q = 0.12
      end
    end

      # a = row["SKU"] || row["Item No"]
      if row.key?("Desc")
        i = row["Desc"]
      else
        i = row["Description"]
       end
 
        k = row["Season_code"] 

        n = row["Product Group"]  

binding.pry
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
          import = Product.new(item_no: a , products_code: x , added_date: u ,  mrp: z ,  brands_code: l , categories_code: m , group_code: n ,
         seasons_code: k , story_code: c ,  products_title: h ,  products_descriptiont: i , products_color: b , products_fabric: d ,
          products_washcare: e , products_sleev: g ,  products_neck: f , products_length: o , stylist_says: j , tax_percent: q , 
          product_sizes: r , product_varients: s , product_team: t , archived: v)
        
          import.save
          # end 
         
      end
      redirect_to root_url, notice: "Imported Successfully" and return
  end
end

 # import = Product.where(order_no: a , price: l , product_mrp: j , tax: m , sale_discount: k  , 
 #          gross_amount: n , amount_payable: u , bank_name: b , e_payment_type:  c , transaction_date: r , Sale_tax_form_acknowledgement_no: e , mps_amount: d)
        
 #        if import.exists?
 #           import.update(amount_payable: u)

 #        else
 #             y = Product.new(order_no: a , way_bill: h , invoice_code: i , client: g ,
 #           customer_email: q , invoice_zone: f , price: l , product_mrp: j , tax: m , sale_discount: k ,
 #            coupon_value: s , gross_amount: n ,  amount_payable: u , e_payment_type: c , payment_status: o ,  bank_name: b , payment_type: t , transaction_date: r ,
 #              Sale_tax_form_acknowledgement_no: e , mps_amount: d)
          
 #            y.save
           
 #        end

 #      end
 #      redirect_to root_url, notice: "Imported Successfully" and return
  # end 