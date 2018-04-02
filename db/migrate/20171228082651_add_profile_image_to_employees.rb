class AddProfileImageToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_reference :employees, :profile_image, foreign_key: true
  end
end
