class StampsController < ApplicationController
  include StampsHelper


  before_action :set_stamp, only: [:show, :edit, :update, :destroy]


  def index
    @count=0
    if params[:issuer]
        @stamps = Stamp.where('issuer=?', params[:issuer]).order('id').page(params[:page])
        @count = Stamp.where('issuer=?', params[:issuer]).count
    else
      @stamps = Stamp.where('issuer=?','XYZ').page(params[:page])
    end

  end


  def search
    @stamps = Stamp.search(params[:q]).page(params[:page]).records
    render action: "index"
  end


  def new
    @stamp = Stamp.new
  end


  def create
    @stamp = Stamp.new(stamp_params)

    respond_to do |format|
      if @stamp.save!
        format.html {
          flash[:success] = "Stamp was successfully created."
          redirect_to stamps_path
        }
        format.json { render :show, status: :created, location: @stamp }
      else
        format.html { render :new }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end

  end


  def edit
  end


  def update
    @stamp = Stamp.find(params[:id])
    @stamp.update_attributes(stamp_params)

    respond_to do |format|
      if @stamp.save!
        format.html {
          flash[:success] = "Stamp was successfully updated."
          redirect_to stamps_path
        }
        format.json { render :show, status: :created, location: @stamp }
      else
        format.html { render :new }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @stamp = Stamp.find(params[:id])
    @stamp.destroy
    redirect_to stamps_path
  end


  def set
    @stamp = Stamp.find(params[:id])
    @set = find_stamps_in_set_with(@stamp)
  end


  def stamp_params
    params.require(:stamp).permit(:country_name,
                                  :sub_country_name,
                                  :set_description,
                                  :set_text,
                                  :set_designer,
                                  :set_start_year,
                                  :set_start_month,
                                  :set_start_day,
                                  :set_end_year,
                                  :set_end_month,
                                  :set_end_day,
                                  :set_perf_info,
                                  :set_type_number,
                                  :set_watermark_number,
                                  :sg_number,
                                  :stamp_prefix,
                                  :stamp_sg_number,
                                  :stamp_pre_suffix,
                                  :stamp_suffix,
                                  :stamp_description,
                                  :variety_description,
                                  :stamp_issue_price,
                                  :stamp_type_number,
                                  :stamp_unused,
                                  :stamp_used,
                                  :variety_flag)
  end


  private


  # Use callbacks to share common setup or constraints between actions.
  def set_stamp
    @stamp = Stamp.find(params[:id])
  end


end
