require "net/https"
require "json"
require_relative "google_api"

class GraphOfCities
	def initialize(filename)
		@city_matrix = []
		@cities = {}
		arr = File.readlines(filename)
		arr.map! { |x| x.strip }
		for city in arr 
			@cities[city] = { index: @cities.length, visited: false }
		end
		@city_matrix = Array.new(@cities.length) { Array.new(@cities.length) }
	end

	def reset_visited
		@cities.each_value { |v| v[:visited] = false }
	end

	def cities
		@cities.keys
	end

	def visited?(city)
		(@cities[city][:visited] == true)
	end

	def visited(city)
		@cities[city][:visited] = true
	end

	def not_yet_visited(city)
		h = @cities.select { |k, v| !v[:visited] && k != city }
		h.keys
	end

	def distance(from, to)
		# puts "#{@cities[from][:index]}, #{@cities[to][:index]}"
		@city_matrix[@cities[from][:index]][@cities[to][:index]]
	end

	def google_url
		"https://maps.googleapis.com/maps/api/distancematrix/json"
	end

	def build_matrix
		uri = URI(google_url)
		@cities.each { |from_city, h1|

			@cities.each { |to_city, h2|	
				if 	from_city != to_city
					params = {units: "imperial", origins: from_city, destinations: to_city, key: google_key}
					uri.query = URI.encode_www_form(params)
					# puts uri 
					res = Net::HTTP.get_response(uri)
					# puts res
					# puts res.body
					if res.is_a?(Net::HTTPSuccess)
						result = JSON.parse(res.body)
						# puts result
						if result["rows"][0]["elements"][0]["status"] == "OK"
							distance = result["rows"][0]["elements"][0]["distance"]["text"] + ", mi"
							# puts "distance #{distance}"
							distance.delete!(",").delete!(" mi")
							@city_matrix[h1[:index]][h2[:index]] = distance.to_i
							# puts "From #{from_city} to #{to_city} is #{distance} mi"
						end
					else
						puts "Something went wrong"
					end
				else
					@city_matrix[h1[:index]][h2[:index]] = 0
				end
			}
		}
	end

	def print_matrix
		puts @city_matrix.to_s
	end
end
