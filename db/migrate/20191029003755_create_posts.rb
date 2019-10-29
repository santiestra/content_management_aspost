class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.datetime :date
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
