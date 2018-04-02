class StudentFeeReceiptMailer < ApplicationMailer

	default :from => 'testingemail.thoughtbees@gmail.com'

	def send_studentfee_receipt(student_detail, student_fee_pay, generated_pdf_name)
	    @student_detail = StudentDetail.find student_detail
	    @student_fee_pay = StudentFeePay.find student_fee_pay
	    @generated_pdf_name = generated_pdf_name
	    if @student_detail.father_email.present?
	    	to_mail_id = @student_detail.father_email
	    elsif @student_detail.mother_email.present?
	    	to_mail_id = @student_detail.mother_email
	    end
	  attachments[@generated_pdf_name] = File.read(Rails.root.join("public/pdfs/#{@generated_pdf_name}"))
	
	     mail( :to => to_mail_id,
	     :subject => "BrainCarve Fee Receipt")
	end


	# def fees_receipt(student_detail, fee_detail)
	#     @student_detail = StudentDetail.find student_detail
	#     @fee_detail = StudentFeePay.find fee_detail
	#     if @student_detail.father_email.present?
	#     	to_mail_id = @student_detail.father_email
	#     elsif @student_detail.mother_email.present?
	#     	to_mail_id = @student_detail.mother_email
	#     end
	#      mail( :to => to_mail_id,
	#      :subject => "BrainCarve Fee Receipt")

	#    # fees_receipt = Todo.find(todo_id)
	#     attachments["fees_receipt_#{fees_receipt.id}.pdf"] = WickedPdf.new.pdf_from_string(
	#       render_to_string(pdf: 'fees_receipt', template: 'fees_receipt.pdf.erb', layout: 'pdf.html'), { :hash_with_wickedpdf_options}
	#     )
	#     mail(to: to_mail_id, subject: 'BrainCarve Fee Receipt', todo: todo)
	# end

end
