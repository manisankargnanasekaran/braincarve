class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.all
     anounceid1 = AnnouncementFor.where(created_at: Date.today..Date.today+10).pluck(:announcement_id).uniq
     anounceid2 = Announcement.where(created_at: Date.today..Date.today+10, is_for_all: true).pluck(:id).uniq
     @announcement = anounceid1 + anounceid2
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
     #@announcement.build_announcement_for
     @announcement.announcement_for.build 
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements
  # POST /announcements.json
  def create
   
    @announcement = Announcement.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        if params[:franchisee_id].present?
        ids = params[:franchisee_id]

        ids.each do |i| 
         AnnouncementFor.create(announcement_id: @announcement.id, franchisee_id: i)
        end
      end
        format.html { redirect_to announcements_url, notice: 'Announcement was successfully created.' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url, notice: 'Announcement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def announcement_deactive
    Announcement.find(params[:id]).update(deactivated: true)
    redirect_to announcements_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:announcement_date, :message, :is_for_all, :deactivated)
    end
end
