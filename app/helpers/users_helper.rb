module UsersHelper
	def display_in_list(items)
		puts "EHTESH>>>>>>>>>> UsersHelper.display_in_list() called"

		# content_tag(:p, "Rails HTML content builder")

		content_tag(:ul) do
			items.each do |item|
				concat content_tag(:li, item)
			end
		end

		# # alternate way of writing:
		# a = content_tag(:ul)
		# a.concat(content_tag(:li, "1"))
		# a.concat(content_tag(:li, "2"))
	end
end
