class FranchiseeRoyalty < ApplicationRecord
  belongs_to :franchisee
	
	#validates_presence_of :student_royalty, :franchisee_royalty, :message=> "Required"

  def self.franchisee_royalty(data)

  

  	if data.franchisee_royalties.present?
  		if data.franchisee_royalties.first.to_nf.present?
  			franchisee_percentage = data.franchisee_royalties.first.franchisee_nf_royalty
  			advance_amount = data.franchisee_agreement.advance_amount_gst
  			amount1 = advance_amount*franchisee_percentage/100
  			RoyaltyDetail.create(franchisee_id: data.id, to_franchisee: data.franchisee_royalties.first.to_nf, amount: amount1, royalty_type: false, paid_status: false)
  		end

  		if data.franchisee_royalties.first.to_mf.present?
  			franchisee_percentage = data.franchisee_royalties.first.franchisee_mf_royalty
  			advance_amount = data.franchisee_agreement.advance_amount_gst
  			amount2 = advance_amount*franchisee_percentage/100
  			RoyaltyDetail.create(franchisee_id: data.id, to_franchisee: data.franchisee_royalties.first.to_mf, amount: amount2, royalty_type: false, paid_status: false)
  		end

  		if data.franchisee_royalties.first.to_df.present?
  	        franchisee_percentage = data.franchisee_royalties.first.franchisee_df_royalty
  			advance_amount = data.franchisee_agreement.advance_amount_gst
  			amount3 = advance_amount*franchisee_percentage/100
  			RoyaltyDetail.create(franchisee_id: data.id, to_franchisee: data.franchisee_royalties.first.to_df, amount: amount3, royalty_type: false, paid_status: false)
  	    end

  	end

    if data.company_royalties.first.present?
    	company_percentage = data.company_royalties.first.franchisee_royalty
    	advance_amount = data.franchisee_agreement.advance_amount_gst
    	company_amount = advance_amount*company_percentage/100
    	CompanyRoyaltyDetail.create(franchisee_id: data.id, amount: company_amount, paid_status: true, royalty_type: false)
  	end

  end


  def self.get_royalty_percentage(k, due_royalty, current_user)
    
      franchisee_type = current_user.franchisee.franchisee_type
      case franchisee_type
      when "National Franchisee(NF)"
        FranchiseeRoyalty.where(franchisee_id: k, to_nf: current_user.franchisee.id).present? ? FranchiseeRoyalty.where(franchisee_id: k, to_nf: current_user.franchisee.id).last.franchisee_nf_royalty : nil
      when "Master Franchisee(MF)"
        FranchiseeRoyalty.where(franchisee_id: k, to_mf: current_user.franchisee.id).present? ? FranchiseeRoyalty.where(franchisee_id: k, to_mf: current_user.franchisee.id).last.franchisee_mf_royalty : nil
      when "District Franchisee(NF)"
        FranchiseeRoyalty.where(franchisee_id: k, to_df: current_user.franchisee.id).present? ? FranchiseeRoyalty.where(franchisee_id: k, to_df: current_user.franchisee.id).last.franchisee_df_royalty : nil
      else      
        FranchiseeRoyalty.where(franchisee_id: k, to_df: current_user.franchisee.id).present? ? FranchiseeRoyalty.where(franchisee_id: k, to_df: current_user.franchisee.id).last.franchisee_df_royalty : nil
      end
      
  end
 

end
