class AgreementRenewal < ApplicationRecord
  belongs_to :franchisee
  belongs_to :franchisee_document, optional: true
  accepts_nested_attributes_for :franchisee_document, allow_destroy: true
end
