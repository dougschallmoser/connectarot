module UsersHelper
  def display_user_photo(user)
    image_tag(user.image, id: "profile-pic") if user.image
  end
end