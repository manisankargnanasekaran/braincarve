class FranchiseeContact < ApplicationRecord
  belongs_to :franchisee
  # validates_format_of :email_id, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i , :allow_blank => true, message: "Invalid Email"
  # validates_presence_of :contact_no, :message=> "Required"
  # validates_length_of :contact_no, :minimum=>6, :allow_blank=>true
  # validates :contact_no, :numericality => {:only_integer => true}
end
