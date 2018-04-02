module StudentFeePaysHelper

	def fee_type
		
		 if @student_detail.student_fee_pays.where(fee_type: "Registration Fee").count < 1 # => &&  @student_detail.student_fee_pays.where(fee_type: "Class Fee").count < 3
		 ['Registration Fee', 'Class Fee' ] 
		else
		 ['Class Fee']
		end
  	end

  	def payment_mode
  		['Cash', 'Cheque', 'Online' ] 
  		
  	end
end
