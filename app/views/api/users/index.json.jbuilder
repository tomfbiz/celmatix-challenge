json.users do
  json.array! @users do |user|
    json.(user, :email, :created_at)
  end
end
