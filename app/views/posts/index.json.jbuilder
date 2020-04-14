json.array! @posts do |post|
  json.id  post.id
  json.title  post.title
  json.text  post.text
  json.image  post.image
  json.created_at  post.created_at
  json.user.id  post.user.id
  json.user.name  post.user.name
end