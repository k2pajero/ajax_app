class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.timestamps
      #t.型名　:カラム名
    end
  end
end
