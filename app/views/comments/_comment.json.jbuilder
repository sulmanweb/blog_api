json.extract! comment, :id, :content, :article_id, :created_at
json.article_slug comment.article.slug

json.user do
  json.partial! 'users/user', user: comment.user
end
