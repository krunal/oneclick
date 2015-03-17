json.file do
  json.id @attachment.id
  json.filename @attachment.filename
  json.user do |user|
  	json.id @attachment.user.id
  	json.name @attachment.user.name
  end
  json.mlink (request.base_url + @attachment.mlink)
  json.small_image_url @attachment.file_object.small.url
  json.big_image_url @attachment.file_object.big.url
  json.medium_image_url @attachment.file_object.medium.url
  json.original_image_url @attachment.file_object.url
  json.created_at @attachment.created_at.strftime("%b %d, %Y, %H:%M")
end