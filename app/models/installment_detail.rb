class InstallmentDetail < ApplicationRecord
  belongs_to :franchisee

  def self.franchisee_royalty(data, amount, date)

    if data.franchisee_royalty.present?
  		if data.franchisee_royalty.to_nf.present?
  			franchisee_percentage_nf = data.franchisee_royalty.franchisee_nf_royalty
  			amount1 = amount.to_f*franchisee_percentage_nf/100
        
  			RoyaltyDetail.create(franchisee_id: data.id, to_franchisee: data.franchisee_royalty.to_nf, amount: amount1, royalty_type: false, paid_status: false, due_date: date)
  		end

  		if data.franchisee_royalty.to_mf.present?
  			franchisee_percentage_mf = data.franchisee_royalty.franchisee_mf_royalty
  			amount2 = amount.to_f*franchisee_percentage_mf/100
  			RoyaltyDetail.create(franchisee_id: data.id, to_franchisee: data.franchisee_royalty.to_mf, amount: amount2, royalty_type: false, paid_status: false, due_date: date)
  		end

  		if data.franchisee_royalty.to_df.present?
  	        franchisee_percentage_df = data.franchisee_royalty.franchisee_df_royalty
  			amount3 = amount.to_f*franchisee_percentage_df/100
  			RoyaltyDetail.create(franchisee_id: data.id, to_franchisee: data.franchisee_royalty.to_df, amount: amount3, royalty_type: false, paid_status: false, due_date: date)
  	    end

  	end


  	if data.company_royalty.present?
    
    	company_percentage = data.company_royalty.franchisee_royalty
    	company_amount = amount.to_f*company_percentage/100
    	CompanyRoyaltyDetail.create(franchisee_id: data.id, amount: company_amount, paid_status: true, royalty_type: false)

  	end
  end


  def self.advance_amount_entry(franchisee)
    InstallmentDetail.create(franchisee_id: franchisee.id, installment_date: Date.today, installment_amount: franchisee.franchisee_agreement.advance_amount_gst, paid_status: false, due_balance: franchisee.franchisee_agreement.balance_amount_gst, actual_balance: franchisee.franchisee_agreement.balance_amount_gst, is_advance: true)
  end

end
