class CreateAgreementRenewals < ActiveRecord::Migration[5.1]
  def change
    create_table :agreement_renewals do |t|
      t.references :franchisee, foreign_key: true
      t.date :renewed_date
      t.references :franchisee_document, foreign_key: true

      t.timestamps
    end
  end
end
