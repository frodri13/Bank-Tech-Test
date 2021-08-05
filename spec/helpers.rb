module Helpers
	def current_date
		date = Time.new
		"#{date.day}/#{date.month}/#{date.year}"
	end
end