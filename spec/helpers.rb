module Helpers
	def capture_stdout(&block)
		original_stdout = $stdout
		$stdout = fake = StringIO.new
		begin
			yield
		ensure
			$stdout = original_stdout
		end
		fake.string
	end
	def current_date
		date = Time.new
		"#{date.day}/#{date.month}/#{date.year}"
	end
end