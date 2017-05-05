module ApplicationHelper
	def title(page_title)
		content_for(:title) { page_title }
	end
	def subtitle(page_subtitle)
		content_for(:subtitle) { page_subtitle }
	end
	def paragraph(page_paragraph)
		content_for(:paragraph) { page_paragraph }
	end
end
