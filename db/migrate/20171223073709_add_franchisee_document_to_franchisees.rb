class AddFranchiseeDocumentToFranchisees < ActiveRecord::Migration[5.1]
  def change
    add_reference :franchisees, :franchisee_document, foreign_key: true
  end
end
