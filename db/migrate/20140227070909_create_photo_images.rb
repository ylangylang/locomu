class CreatePhotoImages < ActiveRecord::Migration
  def change
    create_table :photo_images do |t|
      t.integer :user_photo_id
      t.binary :image
      t.integer :image_size
      t.integer :image_width
      t.integer :image_height
      t.binary :thumb
      t.integer :thumb_size
      t.integer :thumb_width
      t.integer :thumb_height
      t.binary :icon
      t.integer :icon_size
      t.integer :icon_width
      t.integer :icon_height

      t.timestamps
    end
  end
end
