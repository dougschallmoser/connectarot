module UsersHelper
  def display_user_photo(user)
    image_tag(user.image, width: "200", id: "profile-pic") if user.image
  end
end