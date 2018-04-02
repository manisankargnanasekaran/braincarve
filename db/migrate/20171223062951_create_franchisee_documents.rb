class CreateFranchiseeDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :franchisee_documents do |t|
      t.string :image_url

      t.timestamps
    end
  end
end
