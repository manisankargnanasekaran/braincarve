class ReportsController < ApplicationController

	def student_reports
    @students = Student.where(created_by_id: session[:user_id]).order(created_at: :desc)
	end

	def student_report_show
		
		
    @students_report = Student.find(params[:student_id])
    student_detail = StudentDetail.find(params[:student_id]).id

    @student_fee = StudentFeePay.where(student_detail_id: student_detail)
    @attendance = Attendance.where(student_id: params[:student_id])

	end

	def student_report_generates

		if params[:format] == "xls"
			data= params[:id]
			@students_report = Student.find(params[:id])
			student_detail = StudentDetail.find(params[:id]).id

    @student_fee = StudentFeePay.where(student_detail_id: student_detail)
    @attendance = Attendance.where(student_id: params[:id])
      # @service = params[:data]
        respond_to do |format|
          format.html
          format.xls# { template = 'purchase_logs/pdf_down.html.erb' }
        end
      end
	end	

  def all_student_report
 
    @selected_period = 1.month.ago.beginning_of_month.to_date..1.month.ago.end_of_month.to_date
    #Student.where(created_by_id: session[:user_id]).map{|i| i.student_detail}.map{|j| j.student_fee_pays.where(fee_type: "Class Fee").group_by{|k| [k.dated.month, k.dated.year]}}
    @students = Student.where(created_by_id: session[:user_id]).order(created_at: :desc)
  end

  def monthwise_student_report
    #byebug
    converted_date = Date.new(params[:year_selected].to_i, params[:month_selected].to_i)
    @selected_period = converted_date.to_date.beginning_of_month..converted_date.to_date.end_of_month
    #@student_payments = StudentFeePay.where(franchisee_id: current_user.franchisee.id, dated: selected_period,  fee_type: "Class Fee")
    @students = Student.where(created_by_id: session[:user_id]).order(created_at: :desc)
  end

  def report_xls_generate
    #@selected_period = params[:date].map{|i| i}
    @selected_period = params[:date]
    @students = Student.where(id: params[:data])
  end


  def income
    @payment = Payment.where(payment_date: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)
     @exp = Expense.where(date: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)
     @payments =  @payment.present? ? @payment : []
        @expes =  @exp.present? ? @exp : []
     @expense =  @payments + @expes
       
        @invoice = InvoicePayment.where(payment_date: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)
      @royalty = CompanyRoyaltyDetail.where(created_at: 1.month.ago.beginning_of_month..1.month.ago.end_of_month) 
    
    @invoice_amount =  @invoice.present? ? @invoice : []
      @royalty_amount =  @royalty.present? ? @royalty : []

     @income = @invoice_amount + @royalty_amount

  end

  def dynamic_income
   if params[:date_range].present?
    date_range = params[:date_range]
    if date_range.split('to').length > 1

      startDate = params[:date_range].split('to')[0].strip.to_date-1 if params[:date_range].present?   
      endDate = params[:date_range].split('to')[1].strip.to_date+1 if params[:date_range].present?

   #byebug
      @payment = Payment.where(payment_date: startDate..endDate) if Payment.where(payment_date: startDate..endDate).present?
      @exp = Expense.where(date: startDate..endDate) if Expense.where(date: startDate..endDate).present?
      
    @payments =  @payment.present? ? @payment : []
        @expes =  @exp.present? ? @exp : []
     @expense =  @payments + @expes
     
      @invoice = InvoicePayment.where(payment_date: startDate..endDate)
      @royalty = CompanyRoyaltyDetail.where(created_at: startDate..endDate) 

      @invoice_amount =  @invoice.present? ? @invoice : []
      @royalty_amount =  @royalty.present? ? @royalty : []

     @income = @invoice_amount + @royalty_amount
       
    end
 
  else
     @payment = Payment.where(payment_date: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)
     @exp = Expense.where(date: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)
     @payments =  @payment.present? ? @payment : []
        @expes =  @exp.present? ? @exp : []
     @expense =  @payments + @expes
       
        @invoice = InvoicePayment.where(payment_date: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)
      @royalty = CompanyRoyaltyDetail.where(created_at: 1.month.ago.beginning_of_month..1.month.ago.end_of_month) 
    
    @invoice_amount =  @invoice.present? ? @invoice : []
      @royalty_amount =  @royalty.present? ? @royalty : []

     @income = @invoice_amount + @royalty_amount


  end
  end


  def renewal_report
    @renewals = Franchisee.all
  end

  def dynamic_renewal_data
      if params[:date_range].present?
          date_range = params[:date_range]
              if date_range.split('to').length > 1
                startDate = params[:date_range].split('to')[0].strip.to_date-1 if params[:date_range].present?   
                endDate = params[:date_range].split('to')[1].strip.to_date+1 if params[:date_range].present?

                @renewals = Franchisee.where(latest_renewal: startDate..endDate)
              else
                @renewals = Franchisee.all
              end
        else
           @renewals = Franchisee.all
        end      
  end


end
