json.client @client_id
json.utoken @token
json.uid @resource.uid
json.user do
  json.id @resource.id

  json.email @resource.email
end
