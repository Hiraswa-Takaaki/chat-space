json.content @message.content
json.image @message.image.url
json.date @message.created_at.strftime("%Y/%m/%d %H:%M")
json.user_id @message.user.name
json.updated_at @message.updated_at
