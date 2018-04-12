require 'open-uri'
require 'nokogiri'

def incubateurs_france
	doc = Nokogiri::HTML(open("http://www.mon-incubateur.com/site_incubateur/incubateurs"))
	incubator_name = doc.css("#incubators_list span a")
	# incubator_zip_code
	# incubator_link
end	