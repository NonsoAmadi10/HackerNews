class AddUserCommunityToWhistle < ActiveRecord::Migration[6.1]
  def change
    add_reference :whistles, :user, null: false, foreign_key: true
    add_column :whistles, :community_id, :integer
  end
end
