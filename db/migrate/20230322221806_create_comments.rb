class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :user
      t.string :comment
      t.integer :article_id
      t.timestamps
    end
  end
end
