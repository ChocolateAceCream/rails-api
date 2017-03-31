class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: { message: "Email has been taken" },
                      presence: { message: "Email is required"}
    validates :name,  uniqueness: { message: "Name has been taken" }, presence: { message: "Name is required"}
    validates :password, :presence => true,
                         :confirmation => true,
                         :length => {:within => 6..40},
                         :on => :create

end
