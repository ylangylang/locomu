class CreatePhotoImages < ActiveRecord::Migration
  def change
    create_table :photo_images do |t|
      t.references :user_photo,           null: false

      t.binary :image
      t.integer :image_size,        null: false, default: 0
      t.integer :image_width,       null: false, default: 0
      t.integer :image_height,      null: false, default: 0
      t.binary :thumb
      t.integer :thumb_size,        null: false, default: 0
      t.integer :thumb_width,       null: false, default: 0
      t.integer :thumb_height,      null: false, default: 0
      t.binary :icon
      t.integer :icon_size,         null: false, default: 0
      t.integer :icon_width,        null: false, default: 0
      t.integer :icon_height,       null: false, default: 0

      t.timestamps
    end
  end
end
