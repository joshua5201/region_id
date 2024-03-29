class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :query]
  before_action :authenticate_owner!, only: [:edit, :update]

  # GET /regions
  # GET /regions.json
  def index
    @regions = current_user.regions
  end

  def about
  end
  # GET /regions/1
  # GET /regions/1.json
  def show
  end

  def query
    @regions = params[:ssids].collect do |ssid|
      begin
        Region.friendly.find(ssid.downcase)
      rescue ActiveRecord::RecordNotFound
        nil
      end
    end
    @regions = @regions.select{|a| not a.nil?}
    if @regions.empty?
      flash[:notice] = "No Spot Information Available."
    end
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)
    @region.user = current_user
    @region.ssid = @region.ssid.downcase

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    @region.ssid = @region.ssid.downcase
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(
        :name, 
        :ssid,
        entries_attributes:
        [
          :id,
          :name,
          :content,
          :picture,
          :_destroy
        ]
      )
    end
    
    def authenticate_owner!
      if not current_user.id == @region.user_id
        redirect_to @region, :notice => "你壞壞"
      end
    end
end
