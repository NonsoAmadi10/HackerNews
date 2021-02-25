class CreateWhistles < ActiveRecord::Migration[6.1]
  def change
    create_table :whistles do |t|
      t.string :title
      t.string :cover_image

      t.timestamps
    end
  end
end
