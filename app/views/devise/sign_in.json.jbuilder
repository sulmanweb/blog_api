json.client @client_id
json.utoken @token
json.uid @resource.uid
json.user do
  json.partial! 'users/user', user: @resource
end
