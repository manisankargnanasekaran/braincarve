class StudentFeePay < ApplicationRecord

  belongs_to :student_detail
  belongs_to :franchisee

  validates :number_of_classes, :payer_name, :amount, :payment_mode, :fee_type, :dated, presence: { :message => "Required" }

  def self.student_royalty(data)

    royalty = FranchiseeRoyalty.find_by(franchisee_id: data.franchisee_id)
    
    if royalty.present?
  
        if royalty.to_nf.present?
           amount1 = royalty.student_nf_royalty*data.amount/100
            if RoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_nf, royalty_type: true).present?
                date1 = RoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_nf, royalty_type: true).first.created_at.to_date
                    if (Date.today.at_beginning_of_month..Date.today.at_end_of_month).include?(date1)
                      data1 = RoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_nf, royalty_type: true)
                      upamount1 = data1.first.amount+amount1
                      data1.first.update(amount: upamount1)
                   else
                      RoyaltyDetail.create(franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_nf, amount: amount1, royalty_type: true, paid_status: false)
                   end
            else
               RoyaltyDetail.create(franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_nf, amount: amount1, royalty_type: true, paid_status: false)
            end
        end



    if royalty.to_mf.present?
    
       amount2 = royalty.student_mf_royalty*data.amount/100    
      if RoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_mf, royalty_type: true).present?
         date2 = RoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_mf, royalty_type: true).first.created_at.to_date
            if (Date.today.at_beginning_of_month..Date.today.at_end_of_month).include?(date2)
              data2 = RoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_mf, royalty_type: true)
              upamount2 = data2.first.amount+amount2
              data2.first.update(amount: upamount2)
           else
             RoyaltyDetail.create(franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_mf, amount: amount2, royalty_type: true, paid_status: false)
           end
      else
        RoyaltyDetail.create(franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_mf, amount: amount2, royalty_type: true, paid_status: false)
      end
    end



     if royalty.to_df.present?

       amount3 = royalty.student_df_royalty*data.amount/100
      if RoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_df, royalty_type: true).present?
         date3 = RoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_df, royalty_type: true).first.created_at.to_date
         if (Date.today.at_beginning_of_month..Date.today.at_end_of_month).include?(date3)
        data3 = RoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_df, royalty_type: true)
        upamount3 = data3.first.amount+amount3
         data3.first.update(amount: upamount3)
       else
        RoyaltyDetail.create(franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_df, amount: amount3, royalty_type: true, paid_status: false)
       end
      else
        RoyaltyDetail.create(franchisee_id: royalty.franchisee_id, to_franchisee: royalty.to_df, amount: amount3, royalty_type: true, paid_status: false)
      end

     end

   end

 end
 


  def self.company_royalty(data)

  	royalty = CompanyRoyalty.find_by(franchisee_id: data.franchisee_id)
  	if royalty.present?
       amount5 = royalty.student_royalty*data.amount/100
         if CompanyRoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: data.franchisee_id, royalty_type: true).present?
           data5 = CompanyRoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: data.franchisee_id, royalty_type: true)
            date5 = CompanyRoyaltyDetail.where(created_at: Date.today.at_beginning_of_month..Date.today.at_end_of_month, franchisee_id: data.franchisee_id, royalty_type: true).first.created_at.to_date
              if (Date.today.at_beginning_of_month..Date.today.at_end_of_month).include?(date5)
  		          upamount5 = data5.first.amount+amount5
                data5.first.update(amount: upamount5)
              else
  		          CompanyRoyaltyDetail.create(franchisee_id: royalty.franchisee_id, amount: amount5, royalty_type: true, paid_status: false)
              end
          else
            CompanyRoyaltyDetail.create(franchisee_id: royalty.franchisee_id, amount: amount5, royalty_type: true, paid_status: false)
          end
  	end
  end

  def self.exclude_royalty(data)
    company_royalty = CompanyRoyalty.find_by(franchisee_id: data.franchisee_id)
    franchisee_royalty = FranchiseeRoyalty.find_by(franchisee_id: data.franchisee_id) 
    if franchisee_royalty.present?
  
      aa = franchisee_royalty.to_nf.present? ? franchisee_royalty.student_nf_royalty : 0
      bb = franchisee_royalty.to_mf.present? ? franchisee_royalty.student_mf_royalty : 0
      cc = franchisee_royalty.to_df.present? ? franchisee_royalty.student_df_royalty : 0
      dd = company_royalty.student_royalty
      royalty = aa+bb+cc+dd
      royalty_amount = royalty*data.amount/100
      balance = data.amount - royalty_amount
      return balance
    else
      royalty = company_royalty.student_royalty
      royalty_amount = royalty*data.amount/100
      balance = data.amount - royalty_amount
     return balance
    end
  end
end
