class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-128.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
