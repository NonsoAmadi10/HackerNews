class AddProfilePicToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pic, :string
  end
end
