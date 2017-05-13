class RunPdf < Prawn::Document
	def initialize(run, ads)
		super(top_margin: 70)
		@run = run
		@ads = ads
		@company = @run.campaign.company
		run_title
	end

	def run_title
		i = 0
		@ads.each do |ad|
			start_new_page if i == 1		
			company = ad.run.campaign.company
			text_box company.name, :align => :center,
			:size => 70
			move_down 100
			text company.title, :align => :center,
			:size => 30
			
			qrcode(ad)
			i = 1
		end
	end

	def qrcode(ad)
		website = ad.company.website
		
		if website.start_with?("http://")
			address = website.gsub("http://", "")
		elsif website.start_with?("https://")
			address = website.gsub("https://", "")			
		elsif website.start_with?("https://www.")
			address = website.gsub("https://www.", "")					
		elsif website.start_with?("www.")
			address = website.gsub("www.", "")	
		else address = website				
		end

		address << "/" unless address.end_with?("/")
		address = address + "ads/" + ad.id.to_s
		#puts address	
		print_qr_code(address, :extent=>372, :align => :center)
	end
end