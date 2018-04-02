class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.date :announcement_date
      t.string :message
      t.boolean :is_for_all

      t.timestamps
    end
  end
end
