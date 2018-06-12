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
    file_name = file.original_filename
      if (file_name === "Content Sheet.xlsx" )
      spreadsheet = Roo::Spreadsheet.open(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
      next unless spreadsheet.row(i)[0]
      row = Hash[[header, spreadsheet.row(i)].transpose]
      row.default = ""

         if row.key?("SKU")
          a = row["SKU"]
          b = row["Color"]
          d = row["Fabric"]
          e = row["Washcare"]
          f = row["neck"]
          g = row["Sleeves"]
          h = row["Title"]
          j = row["Stylist Says"]
          i = row["Desc"]
          u = ""
          z = ""
          l = ""
          m = ""
          n = ""
          k = ""
          c = ""
          o = ""
          q = ""
          r = ""
          s = ""
          t = ""
          v = 0

          check = Product.where(products_code: a)
          if !check.exists?

            import = Product.new(products_code: a , added_date: u ,  mrp: z ,  brands_code: l , categories_code: m , group_code: n ,
           seasons_code: k , story_code: c ,  products_title: h ,  products_descriptiont: i , products_color: b , products_fabric: d ,
            products_washcare: e , products_sleev: g ,  products_neck: f , products_length: o , stylist_says: j , tax_percent: q , 
            product_sizes: r , product_varients: s , product_team: t , archived: v)
            import.save
          else
            check.update(products_code: a , added_date: u ,  mrp: z ,  brands_code: l , categories_code: m , group_code: n ,
           seasons_code: k , story_code: c ,  products_title: h ,  products_descriptiont: i , products_color: b , products_fabric: d ,
            products_washcare: e , products_sleev: g ,  products_neck: f , products_length: o , stylist_says: j , tax_percent: q , 
            product_sizes: r , product_varients: s , product_team: t , archived: v)
         end

         else
          redirect_to root_url, alert: "Due to absence of `SKU` column Import Aborted " and return 
         end

        end
        redirect_to  second_screen_products_url, notice: "Imported Successfully........!" and return 
      else
        redirect_to root_url, alert: "Import Aborted Because of Invalid file selection" and return 
      end
  end


  def second_screen
  end

  def import_second_screen
    file = params[:file]
    file_name = file.original_filename
      if (file_name === "Item Master.xlsx" )
      spreadsheet = Roo::Spreadsheet.open(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
         next unless spreadsheet.row(i)[0]
         row = Hash[[header, spreadsheet.row(i)].transpose]
         row.default = ""

        if row.key?("Item No")
          c = row["Item No"]
          a = row["Brand"]
          b = row["Item Category"]
          d = row["Product Group"]
          e = row["Unit Price"]
            if (e <= 1050.0)
              f = 0.05
            else
              f = 0.12
            end
          g = row["Variant Code"]
          check = Product.where(products_code: c)

          if check.exists?
            check.first.categories_code = b
            check.first.brands_code = a
            check.first.mrp = e
            check.first.group_code = d
            check.first.tax_percent = f
            initial_product_variant = check.first.product_sizes
            if (initial_product_variant === "")
              final_product_variant = g
            else
              final_product_variant = initial_product_variant + ";" + g.to_s
            end              
            check.first.product_sizes = final_product_variant
            check.first.save
        end
        
         else
          redirect_to second_screen_products_url, alert: "Due to absence of `Item No` column Import Aborted " and return 

         end

        end
        redirect_to  third_screen_products_url, notice: "Imported Successfully........!" and return 
      else
        redirect_to second_screen_products_url, alert: "Import Aborted Because of Invalid file selection" and return 
      end
  end

  def third_screen
  end

  def import_third_screen
    file = params[:file]
    file_name = file.original_filename
      if (file_name === "Allocation Sheet.xlsx" )
      spreadsheet = Roo::Spreadsheet.open(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
      next unless spreadsheet.row(i)[0]
      row = Hash[[header, spreadsheet.row(i)].transpose]
      row.default = ""

         if row.key?("Item No")
          c = row["Item No"]
          check = Product.where(products_code: c)
               if check.exists?
                check.first.products_code = c
                check.first.save
               end
          else
          redirect_to second_screen_products_url, alert: "Due to absence of `Item No` column Import Aborted " and return 
         end
       end
       redirect_to  final_screen_products_url, notice: "Imported Successfully........!" and return
      else
        redirect_to third_screen_products_url, alert: "Import Aborted Because of Invalid file selection" and return 
      end
  end

  def final_screen
  end

end