module Mutations
  class DeleteUser < BaseMutation
    # TODO: define return fields
    field :user, Types::UserType, null: true
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :id, Integer, required: true
    # argument :name, String, required: true

    type Types::UserType

    # TODO: define resolve method
    def resolve(id:)
      user = User.find(id)
      user.destroy!
    end
  end
end
