class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.text :content, null: false
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
