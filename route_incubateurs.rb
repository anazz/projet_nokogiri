#inclure les bibliothèques open-uri, nokogiri
require 'open-uri'
require 'nokogiri'

def incubateurs_france
	#création d'un hash
	list = Hash.new	
	#ouvrir le fichier html 
	#création de l'objet doc
	doc = Nokogiri::HTML(open("http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups/"))
	#création de l'objet prices et du fichier incubateurs_fr.txt.txt
	incubator_france = File.new('incubateurs_fr.txt', 'w+')
	#on récupere dans incubator_name le div.entry-title h2 adu fichier html
	incubator_name = doc.css(".listing-row-title a")
	#on récupere dans incubator_zip_code le id frontend_address du fichier html
	incubator_zip_code = doc.css("a.listing-row-image-link")
	#on récupere dans incubator_link le anchor avec l'id website du fichier html
	incubator_link = doc.css("")
	#on fait une iteration sur chaque element de incubator_name
	#afin de recuperer et d'afficher les emails 
	incubator_name.each do |name| 
		#dans name_output on recupere le nom de tous les noms d'incubateurs
		name_output = name.text
		puts name_output
		#on fait une iteration sur chaque element de incubator_zip_code
		#afin de recuperer le prix de tous les codes postales
		incubator_zip_code.each do |code|
			zip_code_output = code.text
			#on fait une iteration sur chaque element de incubator_link
			#afin de recuperer le prix de tous les liens
			    incubator_link.each do |link|
			    	link_output = link['href']
					#on fussione tout dans le hash list
					#list.merge!(name: name_output, code_postal: zip_code_output, lien: link_output)
				end
		end	
		#afficher le hash 
		#puts list

		###!!!
		#enleves le commentaire ci-bas si tu veux ecrire la liste dans le fichier prices.txt
		#incubator_france.write(" " + "#{list}" + "\n")	
	end	
end	

incubateurs_france