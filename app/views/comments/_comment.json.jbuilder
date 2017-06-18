json.extract! comment, :id, :content, :article_id, :created_at

json.user do
  json.partial! 'users/user', user: comment.user
end
