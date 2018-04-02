class FranchiseePersonal < ApplicationRecord
  belongs_to :franchisee
  # validates_presence_of :salutation, :no_of_owners, :message=> "Required"
  # validates :no_of_owners, :numericality => {:only_integer => true}
  # validates :experience, :numericality => true, :allow_blank=>true
end
