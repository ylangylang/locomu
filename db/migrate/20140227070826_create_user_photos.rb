class CreateUserPhotos < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      t.integer :user_id
      t.string :title
      t.string :content_type
      t.string :comment

      t.timestamps
    end
  end
end
