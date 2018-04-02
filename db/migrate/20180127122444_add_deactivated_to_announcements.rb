class AddDeactivatedToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :deactivated, :boolean
  end
end
