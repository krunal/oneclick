json.next_page @attachments.next_page
json.total_pages @attachments.total_pages

json.files @attachments do |attachment|
  json.id attachment.id
  json.filename attachment.filename
  json.mlink (request.base_url + attachment.mlink)
  json.small_image_url attachment.file_object.small.url
  json.big_image_url attachment.file_object.big.url
  json.medium_image_url attachment.file_object.medium.url
  json.original_image_url attachment.file_object.url
  json.created_at attachment.created_at.strftime("%b %d, %Y, %H:%M")
  json.user do |user|
    json.id attachment.user.id
    json.name attachment.user.name
  end
end