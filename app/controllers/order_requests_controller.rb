class OrderRequestsController < ApplicationController
  before_action :set_order_request, only: [:show, :edit, :update, :destroy]

  # GET /order_requests
  # GET /order_requests.json
  def index
    @order_requests = OrderRequest.where(:franchisee_id=>current_user.franchisee.id)
  end

  # GET /order_requests/1
  # GET /order_requests/1.json
  def show
  end

  # GET /order_requests/new
  def new
    @order_request = OrderRequest.new
    @order_request.order_request_items.build
  end

  # GET /order_requests/1/edit
  def edit
    @order_request.order_request_items.build
  end

  # POST /order_requests
  # POST /order_requests.json
  def create
    @order_request = OrderRequest.new(order_request_params)
    @franchisee = @order_request.franchisee_id

    respond_to do |format|
      if @order_request.save
        # For Notifying BrainCarve when new Order placed by any Franchisee
        OrderNotifierMailer.order_notification(@franchisee, @order_request.id).deliver_now!
        format.html { redirect_to order_requests_url, notice: 'Order request was successfully created.' }
        format.json { render :show, status: :created, location: @order_request }
      else
        format.html { render :new }
        format.json { render json: @order_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_requests/1
  # PATCH/PUT /order_requests/1.json
  def update
    respond_to do |format|
      if @order_request.update(order_request_params)
        format.html { redirect_to order_requests_url, notice: 'Order request was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_request }
      else
        format.html { render :edit }
        format.json { render json: @order_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_requests/1
  # DELETE /order_requests/1.json
  def destroy
    @order_request.destroy
    respond_to do |format|
      format.html { redirect_to order_requests_url, notice: 'Order request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def invoice_detail
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_request
      @order_request = OrderRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_request_params
      params.require(:order_request).permit!#(:order_date, :franchisee_id)
    end
end
