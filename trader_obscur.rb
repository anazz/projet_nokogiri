#inclure les bibliothèques open-uri, nokogiri
require 'open-uri'
require 'nokogiri'

def cryptocurrencies
	#création d'un hash
	list = Hash.new	
	#ouvrir le fichier html 
	#création de l'objet doc
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	#création de l'objet prices et du fichier prices.txt
	prices = File.new('prices.txt', 'w+')
	#on récupere dans currency_name la classe .currency-name-container du fichier html
	currency_name = doc.css(".currency-name-container")
	#on récupere dans currency_price la classe .price du fichier html
	currency_price = doc.css(".price")
	#on fait une iteration sur chaque element de currency_name
	#afin de recuperer et d'afficher les emails 
	currency_name.each do |name| 
		#dans name_output on recupere le nom de tous les currencies
		name_output = name.text
		#on fait une iteration sur chaque element de currency_price
		#afin de recuperer le prix de tous les currencies
		currency_price.each do |price|
			price_output = price.text
			#on fussione tout dans le hash list
			list.merge!(name: name_output, price: price_output)
		end	
		#afficher le hash 
		puts list
		
		###!!!
		#enleves le commentaire ci-bas si tu veux ecrire la liste dans le fichier prices.txt
		#prices.write(" " + "#{list}" + "\n")
	end	
end	

cryptocurrencies