json.extract! article, :id, :title, :content, :status, :editor, :slug, :created_at

unless article.user.nil?
  json.user do
    json.partial! 'users/user', user: article.user
  end
end
