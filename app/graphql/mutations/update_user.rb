module Mutations
  class UpdateUser < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :id, ID, required: true
    argument :name, String, required: false

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    def resolve(id:, **args)
      user = User.find(id)

      if user.update(args)
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
