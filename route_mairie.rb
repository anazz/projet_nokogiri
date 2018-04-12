
#inclure les bibliothèques open-uri, nokogiri
require 'open-uri'
require 'nokogiri'

#création de la methode get_the_email_of_a_townhal_from_its_webpage
def get_the_email_of_a_townhal_from_its_webpage
	#ouvrir le fichier html 
	#création de l'objet doc
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	#création de l'objet email et du fichier email_mairie.txt
	email = File.new('email_mairie.txt', 'w+')
	#récuperer l'adresse email et la mettre dans le fichier
	doc.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mail|
	   email.write(mail)
	end
end

#création de la methode et_all_the_urls_of_val_doise_townhalls
def get_all_the_urls_of_val_doise_townhalls
	#ouvrir le fichier html 
	#création de l'objet doc
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	#création de l'objet links et du fichier liens_mairie.txt
	links = File.new('liens_mairies.txt', 'w+')
	#on récupere dans lien la classe .lientxt du fichier html
	lien = doc.css(".lientxt")
	#on fait une iteration sur chaque element de lien 
	#afin de recuperer et d'afficher les liens -> 'href'
	lien.each do |link| 
		puts link['href']
		# enleves le commentaire ci-bas si tu veux ecrire la liste dans le fichier liens_mairies.txt
		#links.write(" " + link['href']+ "\n")	
	end	
end	

def get_all_the_urls_of_val_doise_townhalls_with_emails
	#création d'un hash
	list = Hash.new
	#ouvrir le fichier html 
	#création de l'objet docs
	docs = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	#création de l'objet city_halls et du fichier mairies.txt
	city_halls = File.new('mairies.txt', 'w+')

	#on récupere dans news_links la classe .lientxt du fichier html
	news_links = docs.css(".lientxt")
	#on fait une iteration sur chaque element de news_links 
	#afin de recuperer les liens -> 'href'
	news_links.each do |link|  
		url = "http://annuaire-des-mairies.com" + link['href']
		#on fait une iteration sur chaque element de link 
		#afin de recuperer les emails 
		link.each do |email| 
			page = Nokogiri::HTML(open(url))
		 	email = page.css("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
		 	#on fussione tout dans le hash list
			list.merge!(key: url, value: email)		
			end	
		#afficher le hash 	
		puts list
		#enleves le commentaire ci-bas si tu veux ecrire la liste dans le fichier mairies.txt
		#city_halls.write(" " + "#{list}" + "\n")
	end
end

#appele methode
#get_the_email_of_a_townhal_from_its_webpage
#get_all_the_urls_of_val_doise_townhalls
get_all_the_urls_of_val_doise_townhalls_with_emails