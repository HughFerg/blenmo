class User < ApplicationRecord
  def full_name
    "#{first_name} #{last_name}"
  end

  def profile_photo(size)
    ActionController::Base.helpers.image_tag picture, alt: "#{full_name}'s profile photo", id: "propic", size: size
  end

  def picture_set?
    picture != "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/c/photo.jpg"
  end

  def self.find_or_create_from_auth_hash(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.picture = auth.info.image
      user.balance ||= 0
      user.save!
    end
  end
end
