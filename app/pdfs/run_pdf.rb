class RunPdf < Prawn::Document
	def initialize(run)
		super(top_margin: 70)
		@run = run
		@company = @run.campaign.company
		run_title
		qrcode	
	end

	def run_title
		text_box @company.name, :align => :center,
		:size => 70
		move_down 100
		text @company.title, :align => :center,
		:size => 30
	end

	def qrcode
		address = @company.website.gsub("http://", "") + "5678" #"@ad.id.to_s"
  		qr = RQRCode::QRCode.new( address, :level=>:h, size: 10)
  		move_down 100
  		print_qr_code(address, :extent=>372, :align => :center)
  		#render_qr_code(qr, :dot=> 6, :align => :center, :border => none)
	end
end