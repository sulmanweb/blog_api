class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User

  validates :user_type, presence: true, inclusion: {in: 0..1, message: I18n.t("user.user_type")}

  has_many :articles, dependent: :nullify
  has_many :comments, dependent: :destroy
  # Articles on which user has placed comment
  has_many :commented_articles, through: :comments, source: :article

  def general?
    self.user_type == Rails.configuration.constants['user_type_general']
  end

  def admin?
    self.user_type == Rails.configuration.constants['user_type_admin']
  end
end
