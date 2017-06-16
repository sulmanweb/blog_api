class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.integer :status, null: false, default: Rails.configuration.constants['article_status_draft']
      t.integer :editor, null: false, default: Rails.configuration.constants['article_editor_text']

      t.timestamps
    end
  end
end
