class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  # GET /batches
  # GET /batches.json
  def index
    #@batches = Batch.all
    @batches = Batch.where(created_by_id: session[:user_id]).order(created_at: :desc)
    @batch = Batch.new
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = Batch.new
    #@batch_number = Batch.last.present? ? Batch.pluck(:batch_no).map { |e| e.to_i }.max.to_i + 1 : 1
    @batch_number = Batch.where(:created_by_id=>session[:user_id]).present? ? Batch.where(:created_by_id=>session[:user_id]).pluck(:batch_no).map { |e| e.to_i }.max.to_i + 1 : 1
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches
  # POST /batches.json
  def create

    params[:batch][:batch_end_time] = params[:batch][:batch_time].to_time + (params[:batch][:duration_in_hours].to_i).hours + (params[:batch][:duration_in_minutes].to_i).minutes

    @batch = Batch.new(batch_params)

    respond_to do |format|
      if @batch.save
        @batch.update(:created_by_id=>session[:user_id])
        format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
 
    params[:batch][:batch_end_time] = params[:batch][:batch_time].to_time + (params[:batch][:duration_in_hours].to_i).hours + (params[:batch][:duration_in_minutes].to_i).minutes

    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch.destroy
    respond_to do |format|
      format.html { redirect_to batches_url, notice: 'Batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:batch_no, :day, :batch_time, :duration_in_hours, :duration_in_minutes, :batch_end_time)
    end
end
