module ApplicationHelper
    def user_name(user)
        user.email if user && user.email.present?
        user.email.split('@').first
      end


      def full_name(user)
        # user.first_name + user.last_name

        "{user.last_name}. {user.first_name}"
      end
end
