class PowerPointsController < ApplicationController
  before_action :set_power_point, only: [:show, :edit, :update, :destroy]

  # GET /power_points
  # GET /power_points.json
  def index
    @power_points = PowerPoint.all
  end

  # GET /power_points/1
  # GET /power_points/1.json
  def show
  end

  # GET /power_points/new
  def new
    @power_point = PowerPoint.new
  end

  # GET /power_points/1/edit
  def edit
  end

  # POST /power_points
  # POST /power_points.json
  def create
    @power_point = PowerPoint.new(power_point_params)

    respond_to do |format|
      if @power_point.save
        @power_point.extract_slides
        format.html { redirect_to @power_point, notice: 'Power point was successfully created.' }
        format.json { render :show, status: :created, location: @power_point }
      else
        format.html { render :new }
        format.json { render json: @power_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /power_points/1
  # PATCH/PUT /power_points/1.json
  def update
    respond_to do |format|
      if @power_point.update(power_point_params)
        format.html { redirect_to @power_point, notice: 'Power point was successfully updated.' }
        format.json { render :show, status: :ok, location: @power_point }
      else
        format.html { render :edit }
        format.json { render json: @power_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /power_points/1
  # DELETE /power_points/1.json
  def destroy
    @power_point.destroy
    respond_to do |format|
      format.html { redirect_to power_points_url, notice: 'Power point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power_point
      @power_point = PowerPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def power_point_params
      params.require(:power_point).permit(:name, :output_path, :file_name, :file_size, :file_type, :pptfile)
    end
end
