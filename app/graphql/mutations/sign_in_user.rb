module Mutations
  class SignInUser < BaseMutation
    null true

    #? TODO: define return fields
    field :token, String, null: true
    field :user, Types::UserType, null: true

    #? TODO: define arguments
    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    # TODO: define resolve method
    # def resolve(email: nil)
    def resolve(credentials: nil)
      return unless credentials
      user = User.find_by email: credentials[:email]

      return unless user 
      return unless user.authenticate(credentials[:password])

      #? USE ROR ACTIVESUPPORT::MESSAGEENCRYPTOR, TO BUILD A TOKEN
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      context[:session][:token] = token

      { user: user, token: token }
    end
  end
end
