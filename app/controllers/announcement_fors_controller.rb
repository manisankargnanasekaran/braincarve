class AnnouncementForsController < ApplicationController
  before_action :set_announcement_for, only: [:show, :edit, :update, :destroy]

  # GET /announcement_fors
  # GET /announcement_fors.json
  def index
    @announcement_fors = AnnouncementFor.all
  end

  # GET /announcement_fors/1
  # GET /announcement_fors/1.json
  def show
  end

  # GET /announcement_fors/new
  def new
    @announcement_for = AnnouncementFor.new
  end

  # GET /announcement_fors/1/edit
  def edit
  end

  # POST /announcement_fors
  # POST /announcement_fors.json
  def create
    @announcement_for = AnnouncementFor.new(announcement_for_params)

    respond_to do |format|
      if @announcement_for.save

        
        format.html { redirect_to @announcement_for, notice: 'Announcement for was successfully created.' }
        format.json { render :show, status: :created, location: @announcement_for }
      else
        format.html { render :new }
        format.json { render json: @announcement_for.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcement_fors/1
  # PATCH/PUT /announcement_fors/1.json
  def update
    respond_to do |format|
      if @announcement_for.update(announcement_for_params)
        format.html { redirect_to @announcement_for, notice: 'Announcement for was successfully updated.' }
        format.json { render :show, status: :ok, location: @announcement_for }
      else
        format.html { render :edit }
        format.json { render json: @announcement_for.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcement_fors/1
  # DELETE /announcement_fors/1.json
  def destroy
    @announcement_for.destroy
    respond_to do |format|
      format.html { redirect_to announcement_fors_url, notice: 'Announcement for was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement_for
      @announcement_for = AnnouncementFor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_for_params
      params.require(:announcement_for).permit(:announcement_id, :franchisee_id)
    end
end
