module Types
  class MutationType < Types::BaseObject
    field :sign_in_user, mutation: Mutations::SignInUser
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser
    field :update_entry, mutation: Mutations::UpdateEntry
    field :delete_entry, mutation: Mutations::DeleteEntry
    field :create_entry, mutation: Mutations::CreateEntry
    field :create_user, mutation: Mutations::CreateUser
  end
end
