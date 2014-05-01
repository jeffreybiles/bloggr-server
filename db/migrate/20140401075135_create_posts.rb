class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :video_url
      t.string :author
      t.date :date
      t.string :body

      t.timestamps
    end
  end
end
