module ApplicationHelper

	def link_hashtag(str)
		str.gsub(/#(\S+)/, "<a href='/hashtags/\\1'>#\\1</a>").html_safe
	end

end
