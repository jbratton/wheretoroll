class Admin < ActiveRecord::Base
  # Adjusted devise modules for admin only. Others available are:
  # :confirmable, :omniauthable, :registerable, :recoverable, :validatable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable, :rememberable
end
