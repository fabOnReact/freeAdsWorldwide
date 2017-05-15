class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_campaign, only: [:new, :create, :show, :edit, :update]

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id].present?
    @ads = @run.ads
    respond_to do |format|
      format.html
      format.pdf do
        pdf = RunPdf.new(@run, @ads)
        send_data pdf.render, filename: "Print Order N.#{@run.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
    @run.update(:status => "to distribute")
    flash[:warning_run] = "Now remember to check the Print Order as completed after giving away all the fliers with the icon"
  end

  # GET /runs/new
  def new
    @run = Run.new
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)
    @run.valid?
    #respond_to do |format|
      if @run.save
        Run.createAds(@run)
        flash[:warning_run] = 'The Print Order was successfully created, you can click on the download icon to open the file or download it. REMEMBER: If using MOZILLA open the file with Adobe outside the browser, as Mozilla give some problems when printing. You can open the file and dowload it with the following icon: ' 
        redirect_to companies_path
        #format.html { redirect_to companies_path, warning_run_download: 'The Print Order was successfully created, you can click on the download icon to open the file or download it.' }
        #format.json { render companies_path, status: :created, location: @run }
      else
        flash[:error] = "The run was not saved"
        render "new"
        #format.html { render :new }
        #format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to companies_path, notice: 'Run was successfully updated.' }
        format.json { render companies_path, status: :ok, location: @run }
      else
        #binding.pry
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end  


  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to companies_path, notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def newstatus
    flash[:warning] = "Warning! You should change this status only when you gave away all fliers!"
    @run = Run.find(params[:id])    
  end

  def changestatus
    @run = Run.find(params[:id])
    @run.status = Run.nextStatus(@run)

    respond_to do |format|
      if @run.save
        format.html { redirect_to companies_path, notice: "The status was changed to #{@run.status}." }
        flash[:warning_campaign] = "If you want to give away more fliers you should create a new print order by clicking on the print icon"
      else
        format.html { render :newstatus, error: 'The status was not changed, the application had an error' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Run.find(params[:id])
    end

    def set_campaign
      @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:campaign_id, :runprintnumber, :ownads, :city, :location)
    end
end
