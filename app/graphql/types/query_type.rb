module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false do
      description "Gets all users."
    end

    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
      description 'Finds user by ID.'
    end

    def user(id:)
      User.find(id)
    end


    field :entries, [Types::EntryType], null: true do
      description 'Gets all entries.'
    end

    def entries
      Entry.all
    end

    field :entry, Types::EntryType, null: false do
      argument :id, ID, required: true
      description 'Finds post by ID.'
    end

    def entry(id:)
      Entry.find(id)
    end

    field :entriesCount, Integer, null: false do
      description "Returns the total count of entries."
    end

    def entriesCount
      Entry.count
    end

  end
end
