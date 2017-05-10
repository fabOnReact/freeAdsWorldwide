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
			start_new_page if i = 0
		
			company = ad.run.campaign.company
			text_box company.name, :align => :center,
			:size => 70
			move_down 100
			text company.title, :align => :center,
			:size => 30
		
			qrcode(company)
		
			i = 1

		end

	end

	def qrcode(company)
		address = company.website.gsub("http://", "") + "5678" #"@ad.id.to_s"
  		#qr = RQRCode::QRCode.new( address, :level=>:h, size: 10)
  		#move_down 100
  		print_qr_code(address, :extent=>372, :align => :center)
  		#render_qr_code(qr, :dot=> 6, :align => :center, :border => none)
	end
end