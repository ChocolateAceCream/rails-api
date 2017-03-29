class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: { message: "Email has been taken" },
                      presence: { message: "Email is required"},
                      format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :name,  uniqueness: { message: "Name has been taken" }, presence: { message: "Name is required"}
    validates :password, :presence => true,
                         :confirmation => true,
                         :length => {:within => 6..40},
                         :on => :create

end
