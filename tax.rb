module Utils
	def self.round(price) 
		return if price == nil
		return price if price % 5 == 0
		price + 5 - (price % 5)
	end
end

class RegularGoods
	attr_accessor :name, :quantity, :price

	def initialize(name, quantity, price)
		@quantity = quantity
		@name = name
		@price = price*100
	end

	def subtotal
		@quantity * @price
	end

	def tax_rate
		0.10
	end

	def sales_tax
		Utils::round(subtotal * tax_rate)
	end

	def total_price
		subtotal + sales_tax 
	end
end

class Exempt < RegularGoods
	def tax_rate
		0
	end
end

class ImportedRegular < RegularGoods
	def tax_rate
		0.15
	end
end

class ImportedExempt < Exempt
	def tax_rate
		0.05
	end
end

class Receipt
	attr_accessor :products

	def initialize(*products)
		@products = products
	end

	def print
		@products.each do |currentitem|
			puts currentitem.name
			puts currentitem.tax_rate.round(2)
			puts currentitem.sales_tax.round(2)
			puts currentitem.total_price.round(2)
		end
	end
end



regulargoods2 = RegularGoods.new("music cd", 1, 14.99)

regulargoods3 = RegularGoods.new("bottle of perfume", 1, 18.99)

exempt = Exempt.new("chocolate bar", 1, 0.85)

exempt2 = Exempt.new("packet of headache pills", 1, 9.75)

exempt3 = Exempt.new("book", 1, 12.49)

importedregular = ImportedRegular.new("imported bottle of perfume", 1, 47.50)

importedregular2 = ImportedRegular.new("imported bottle of perfume", 1, 27.99)

importedexempt = ImportedExempt.new("imported box of chocolates", 1, 10.00)

importedexempt2 = ImportedExempt.new("box of imported chocolates", 1, 11.25)

r = [regulargoods2, regulargoods3]
e = [exempt, exempt2, exempt3]
ir = [importedregular, importedregular2]
ie = [importedexempt, importedexempt2]



listofthings = [r, e, ir, ie]

listofthings.each do |currentitem|
	currentitem.each do |x|
	puts x.tax_rate
	puts x.name
	puts x.sales_tax/100.0
	puts x.total_price/100.0
	end
end

receipt = Receipt.new(r, e, ir, ie)






