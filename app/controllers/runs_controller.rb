class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy, :delete]

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
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

    respond_to do |format|
      if @run.save
        
        #createAds

        end
        format.html { redirect_to runs_path, notice: 'Run was successfully created.' }
        format.json { render :index, status: :created, location: @run }
      else
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end
=begin
  def createAds
    # creating your own ads for that run
    @run.ownads.times
      Ad.create(:company_id => @run.campaign.company, :run_id => @run.id, :selfpromotion => true)
    end

    # creating other people ads for that run
    (@run.runprintnumber - @run.ownads).times do
      campaigns = Campaign.where.not(:company_id => run_params.company_id).rewhere(:campaigntype_id => @run.campaign.campaigntype_id).order(:created_at)
      # you calculated the visitratio, use it to order the campaigns
      campaigns.order(:visitratio).reverse_order
      Ad.create(:company_id => , :run_id => @run.id, :selfpromotion => false)
      # add field for taking count of this number of adds in the campaing.adsreceived
    end
  end
=end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
        format.json { render :show, status: :ok, location: @run }
      else
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
      format.html { redirect_to runs_url, notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Run.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:campaign_id, :runprintnumber, :ownads)
    end
end
