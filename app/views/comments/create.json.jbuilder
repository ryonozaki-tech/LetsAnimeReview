json.text @comment.text
json.id @comment.id
json.user_id @comment.user.id
json.user_name  @comment.user.nickname
json.created_at @comment.created_at.strftime("%Y/%m/%d日 %H:%M")
