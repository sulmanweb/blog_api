class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true, inclusion: {in: Rails.configuration.constants['article_status_draft']..Rails.configuration.constants['article_status_revised'], message: I18n.t('article.status')}
  validates :editor, presence: true, inclusion: {in: Rails.configuration.constants['article_editor_text']..Rails.configuration.constants['article_editor_markdown'], message: I18n.t('article.editor')}

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  scope :for_general_users , -> { where(status: (Rails.configuration.constants['article_status_published']..Rails.configuration.constants['article_status_revised']).to_a) }
end
