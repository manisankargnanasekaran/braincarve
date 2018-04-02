class CreateAnnouncementFors < ActiveRecord::Migration[5.1]
  def change
    create_table :announcement_fors do |t|
      t.references :announcement, foreign_key: true
      t.references :franchisee, foreign_key: true

      t.timestamps
    end
  end
end
