class AuthenticateUser
    prepend SimpleCommand

    def initialize(email, password)
        @email = email
        @password = password
    end

    def call
        JsonWebToken.encode(user_id: user.id) if user
    end

    private

    attr_accessor :email, :password

    def user
        user = User.find_by_email(email)
        if !user
            errors.add :authentication_error, 'email not found'
        elsif !user.authenticate(password)
            errors.add :authentication_error, 'invalid password'
        else
            return user
        end
        nil
    end

end
