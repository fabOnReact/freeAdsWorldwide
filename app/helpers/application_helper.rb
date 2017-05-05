module ApplicationHelper
	def title(page_title, variable)
		content_for(:title) { page_title }
	end
	def subtitle(page_subtitle)
		content_for(:subtitle) { page_subtitle }
	end
	def paragraph(page_paragraph)
		content_for(:paragraph) { page_paragraph }
	end

	def header(type, text)
		case type
			when "companies"
				content_for(:companies) { text } 
			when "runs"
				content_for(:runs) { text }
			when "campaigns"
				content_for(:campaigns) { text }
		end
	end
end
