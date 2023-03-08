module UsersHelper

 def user_email(user)
    return user.email if user
 end
end
