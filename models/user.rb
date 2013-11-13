class User < ActiveRecord::Base
	has_secure_password
	has_many :reviews
	has_many :events, through: :reviews
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/masks.jpg"
end
