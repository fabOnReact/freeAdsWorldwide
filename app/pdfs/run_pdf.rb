class RunPdf < Prawn::Document
	def initialize(run, ads)
		super(top_margin: 70)
		@run = run
		@ads = ads
		#@company = @run.campaign.company
		instructions
		run_title
	end

	def instructions
		#start_new_page
		text "Instructions", :size => 70
		text "Please follow this instructions", :size => 40
		move_down 10
		text "1. If you are using Mozilla you will need to open the PDF with Adobe otherwise Mozilla will change the layout while printing.", :size => 20
		move_down 10
		text "2. Print the pages and distribute them around your city. You can post them on walls, trees, light poles, give them to shops..etc.. ", :size => 20
		move_down 10
		text "3. Then come back to the website and click on 'DISTRIBUTED' or on the 'v' simbol in the Print list ", :size => 20
		move_down 10
		text "4. Click again on the 'v' symbol so that the Print Order changes to distributed", :size => 20
		move_down 10
		text "5. Your fliers will be given to other members and they will follow the same procedure, keep printing other fliers by clicking on the print icon of your Campaign and you will get more fliers around the world.", :size => 20
		move_down 10
		text "5. You can also use the app on mobile at growstartups.xyz", :size => 20
		move_down 10
		text "NOTICE !! You can only create one Print Order at the time, if you gave away the fliers set the Print Order in the Print List as completed and you will be able to print new ones", :size => 20
		move_down 10
		text "NOTICE !! If you made a mistake in your Print Order you can edit it with the pen icon or delete it, then create a new one.", :size => 20
	end

	def run_title
		i = 0
		@ads.each do |ad|
			start_new_page #if i == 1		
			company = ad.company
			text company.name, :align => :center,
			:size => 70
			#move_down 10
			qrcode(ad, :center)
			move_down 20
			text company.description, :align => :center,
			:size => 30
			move_down 20
			qrcode(ad, :right) 
			move_up 97
			qrcode(ad, :left)
			i = 1
		end
	end

	def qrcode(ad, position)	
		print_qr_code(Ad.address(ad), :extent=>100, :align => position)
	end
end