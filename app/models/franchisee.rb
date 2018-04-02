class Franchisee < ApplicationRecord

  enum franchisee_type:{"National Franchisee(NF)"=> 1, "Master Franchisee(MF)"=> 2, "District Franchisee(DF)"=> 3, "Unit Franchisee(UF)"=> 4}

  has_many :agreement_renewals, :dependent=>:destroy  
  has_many :installment_details, :dependent=>:destroy
  has_one :franchisee_agreement, :dependent => :destroy
  has_many :franchisee_owners, :dependent=>:destroy
  has_one :franchisee_royalty, :dependent=>:destroy
  has_one :company_royalty, :dependent=>:destroy
  has_many :order_requests, :dependent=>:destroy
  has_many :franchisee_inventory_stocks, :dependent => :destroy
  has_many :student_fee_pays
  belongs_to :franchisee_document, optional: true
  after_save :set_franchisee_royalty

  def set_franchisee_royalty

=begin   
franchisee_royalties = self.franchisee_royalties.order(:id=>'asc')
    parent1 = Franchisee.find_by(location: self.parent)
    parent2 = Franchisee.find_by(location: parent1)
    parent3 = Franchisee.find_by(location: parent2)
    parent4 = Franchisee.find_by(location: parent3)
    parent_ids = [parent1,parent1,parent1,parent1]

    if self.parent != "BrainCarve"
    franchisee_royalties.each_with_index do|data, index|
        if index == 0
          data.update(to_franchisee: parent_ids[0])
        elsif index == 1

        elsif index == 2

        elsif index == 3
              
        end
     
      end
    end
=end
  end
  
  accepts_nested_attributes_for :installment_details, :reject_if => :all_blank, allow_destroy: true
  accepts_nested_attributes_for :franchisee_owners, :reject_if => :all_blank, allow_destroy: true
  accepts_nested_attributes_for :company_royalty, :reject_if => :all_blank, allow_destroy: true
  accepts_nested_attributes_for :franchisee_agreement
  accepts_nested_attributes_for :franchisee_royalty, :reject_if => :all_blank, allow_destroy: true
  accepts_nested_attributes_for :franchisee_document, allow_destroy: true
  
  #validates_presence_of :franchisee_type, :location, :student_fee, :message=> "Required"
  belongs_to :user, :dependent => :destroy
  accepts_nested_attributes_for :user, allow_destroy: true

  scope :franchisee_selection, ->(franchisee_type) {where(franchisee_type: franchisee_type)}

  def parent_name
     "#{location} - #{franchisee_type} (#{parent})"
  end

end
