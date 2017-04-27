class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 	has_and_belongs_to_many :companies

 	validates_presence_of :country
 	def country_name
    	country = ISO3166::Country[country_code]
    	country.translations[I18n.locale.to_s] || country.name
  	end
end
