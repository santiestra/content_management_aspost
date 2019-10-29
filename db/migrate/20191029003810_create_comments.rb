class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.datetime :date
      t.integer :user_id
      t.integer :company_id
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
