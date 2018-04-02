class StudentFeePaysController < ApplicationController
  before_action :set_student_fee_pay, only: [:edit, :update, :destroy]

  # GET /student_fee_pays
  # GET /student_fee_pays.json
  def index
    @student_fee_pays = StudentFeePay.all
  end

  # GET /student_fee_pays/1
  # GET /student_fee_pays/1.json
  def show

    @student_fee_pay = Student.find(params[:id]).student_detail.student_fee_pays.last
      #byebug
      # respond_to do |format|
      #   format.html
      #   format.pdf do
      #     pdf = render_to_string pdf: "Test", template: "student_fee_pays/_fees_receipt.html.erb", encoding: "UTF-8"
      #     save_path = Rails.root.join('pdfs','test.pdf')
      #     File.open(save_path, 'wb') do |file|
      #       file << pdf
      #     end
      #     system("lpr", "pdfs/test.pdf")
      #   end    
      # end
  end

  # def bill_pdf
  #      @status = params[:act]
  #     @job_card = JobCard.find(params[:id])
  #     respond_to do |format|
  #       format.html
  #       format.pdf do
  #         render :pdf => "JobCard_bill",disposition: "attachment", :template => 'job_cards/_download.html.erb'
  #       end
  #     end
  # end

  # GET /student_fee_pays/new
  def new
    @student_detail = StudentDetail.find(params[:id])
    @student_fee_pay = StudentFeePay.new
    @franchisee = current_user.franchisee    
  end

  # GET /student_fee_pays/1/edit
  def edit
  end

  # POST /student_fee_pays
  # POST /student_fee_pays.json
  def create
    @student_fee_pay = StudentFeePay.new(student_fee_pay_params)

    respond_to do |format|
      if @student_fee_pay.save
        @student_detail = @student_fee_pay.student_detail_id
        #StudentFeeReceiptMailer.send_studentfee_receipt(@student_detail, @student_fee_pay.id).deliver_now!
 
        if params[:student_fee_pay][:fee_type] == "Class Fee"
        StudentFeePay.student_royalty(@student_fee_pay)
        StudentFeePay.company_royalty(@student_fee_pay)
        @balance = StudentFeePay.exclude_royalty(@student_fee_pay)
      
        @student_fee_pay.update(exclude_royalty: @balance)
      end
        format.html { redirect_to students_url, notice: 'Student fee pay was successfully created.' }
        format.json { render :show, status: :created, location: @student_fee_pay }
      else
        format.html { render :new }
        format.json { render json: @student_fee_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_fee_pays/1
  # PATCH/PUT /student_fee_pays/1.json
  def update
    respond_to do |format|
      if @student_fee_pay.update(student_fee_pay_params)
        format.html { redirect_to @student_fee_pay, notice: 'Student fee pay was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_fee_pay }
      else
        format.html { render :edit }
        format.json { render json: @student_fee_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_fee_pays/1
  # DELETE /student_fee_pays/1.json
  def destroy
    @student_fee_pay.destroy
    respond_to do |format|
      format.html { redirect_to student_fee_pays_url, notice: 'Student fee pay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def fees_receipt
  #   @student = params[:id]
  #   @fee_detail = Student.find(params[:id]).student_detail.student_fee_pays.last.id
  #   #StudentFeeReceiptMailer.fees_receipt(@student, @fee_receipt).deliver_now!
  # end

  def fees_receipt

    @student_fee_pay = StudentFeePay.find(params[:id])
    @student_detail = @student_fee_pay.student_detail_id
      respond_to do |format|
        format.html
        format.pdf do
        render :pdf => "FeesReceipt", disposition: "attachment", :template => 'student_fee_pays/_fees_receipt.html.erb', :save_to_file => Rails.root.join('public/pdfs', "#{@student_fee_pay.student_detail.student.student_name}(#{@student_fee_pay.dated.to_date.strftime("%d-%m-%Y") }).pdf")
      end
    end
    @generated_pdf_name = "#{@student_fee_pay.student_detail.student.student_name}(#{@student_fee_pay.dated.to_date.strftime("%d-%m-%Y") }).pdf"
    StudentFeeReceiptMailer.send_studentfee_receipt(@student_detail, @student_fee_pay.id, @generated_pdf_name).deliver_now!
  end


     #.student_detail.student_fee_pays.last
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #   pdf = render_to_string pdf: "FeesReceipt", template: "student_fee_pays/_fees_receipt.html.erb", encoding: "UTF-8"
    #   save_path = Rails.root.join('pdfs','fees_receipt.pdf')
    #   File.open(save_path, 'wb') do |file|
    #     file << pdf
    #   end
    #    system("lpr", "pdfs/fees_receipt.pdf")
    #   end    
    # end

     
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_fee_pay
      @student_fee_pay = StudentFeePay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_fee_pay_params
      params.require(:student_fee_pay).permit!#(:amount, :reference_number, :dated, :number_of_classes, :fee_type, :payer_name, :student_detail_id, :franchisee_id)
    end
end
