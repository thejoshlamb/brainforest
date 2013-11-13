class User < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader

	#require 'carrierwave/orm/activerecord'

has_secure_password
	validates_presence_of :password, :on => :create
	#automatically creates  :password, :password_confirmation

	has_many :reviews
	has_many :products, :through => :reviews

	validates :nick, :email, :presence => true
	validates_uniqueness_of :nick, :email

end
