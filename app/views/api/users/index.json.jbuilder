json.users do
  json.array! @users do |user|
    json.email user.email
    json.created_at user.created_at.strftime(" %m/%d/%Y %I:%M%p")
  end
end
