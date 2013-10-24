=begin
  INPUT:

  Input 1:
  1 book at 12.49
  1 music CD at 14.99
  1 chocolate bar at 0.85
   
  Input 2:
  1 imported box of chocolates at 10.00
  1 imported bottle of perfume at 47.50
   
  Input 3:
  1 imported bottle of perfume at 27.99
  1 bottle of perfume at 18.99
  1 packet of headache pills at 9.75
  1 box of imported chocolates at 11.25
   
  OUTPUT
   
  Output 1:
  1 book : 12.49
  1 music CD: 16.49
  1 chocolate bar: 0.85
  Sales Taxes: 1.50
  Total: 29.83
   
  Output 2:
  1 imported box of chocolates: 10.50
  1 imported bottle of perfume: 54.65
  Sales Taxes: 7.65
  Total: 65.15
   
  Output 3:
  1 imported bottle of perfume: 32.19
  1 bottle of perfume: 20.89
  1 packet of headache pills: 9.75
  1 imported box of chocolates: 11.85
  Sales Taxes: 6.70
  Total: 74.68 
=end

class SalesTaxes 

  #Each receipt is composed of items (quantity, name, price) in an array

  RECEIPT1 = ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]
  RECEIPT2 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
  RECEIPT3 = ["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]

  #Books, food, and medical products are exempt from basic sales tax 

  TAX_EXEMPT_ITEMS = ["chocolate", "chocolates", "book", "headache pills"]

  #These are all the variable that we are given in the problem (sales tax, import duty, total taxes).

  SALES_TAX = 0.10
  IMPORT_DUTY = 0.05
  BOTH_TAX = 0.15

  #Whenever Ruby creates a new object, it looks for a method named initialize and executes it.

  def initialize
    puts "******First receipt******"
    get_input RECEIPT1
    puts "******Second receipt******"
    get_input RECEIPT2
    puts "******Third receipt******"
    get_input RECEIPT3
  end

  def get_input input_array
    total_tax = 0 #total tax starts at 0
    total_price = 0 #total price starts at 0
    input_array.each do |each_item| #each_item is just a placeholder
      i_item = each_item.split #divides the array into substrings based on the whitespace (whitespace is ignored). Returns an array of strings.
      qty = i_item[0].to_i #the first item in the array will be the quanity of the item. Arrays are zero-indexed. This should be a whole number (integer).
      price = i_item[-1].to_f #the price of the item will be in the last string of the array. -1 points to the price of the item.
      p = each_item.split(" at ") #the list will be split " at ". This will create one array with two strings ["x item", "$$$$"].
      product = p[0].delete("/0-9/").strip #Select the first string in the p array. /0-9/ is a regexp that deletes any numbers. Ruby’s strip() method is useful for stripping extra spaces in strings. 
      tax = tax_cal price, product
      total_tax += tax 
      tax_price = (price.to_f + tax)
      total_price += tax_price
      p "#{qty} #{product}: #{tax_price.round(2)}"
    end
    p "Sales Tax: #{total_tax.round(2)}"
    p "Total: #{total_price.round(2)}"
  end

  def tax_cal price,product
    tax_exclude = []
    a_product = product.split(" ")
    tax_exclude = a_product & TAX_EXEMPT_ITEMS
    if product.include?("imported") and tax_exclude != 1
      tax = price.to_f * BOTH_TAX
    elsif product.include?("imported") and tax_exclude.count == 1
      tax = price.to_f * IMPORT_TAX
    elsif tax_exclude.count != 1
      tax = price.to_f * SALES_TAX
    else
      tax = 0
    end
    return tax
  end

end

SalesTaxes.new













