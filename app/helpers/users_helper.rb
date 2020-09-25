module UsersHelper
  def display_user_photo(user)
    if user.image
      image_tag(user.image, width: "200", id: "profile-pic")
    end
  end
end