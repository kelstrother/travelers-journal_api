module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    #* ///////////////////////////////////////////////////////////////
    #? /////////// User Queries ////////////////////////////////////
    field :users, [Types::UserType], null: false
      description "Returns all existing Users."

    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      description 'Returns one User based on its ID.'
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end
    #? ///////////////////////////////////////////////////////////
    #* //////////////////////////////////////////////////////////

    #* ///////////////////////////////////////////////////////////
    #? ///////////// Entry Queries /////////////////////////////
    description 'Returns all existing Entries.'
    field :entries, [Types::EntryType], null: true do
    end

    def entries
      Entry.all
    end

    field :entry, Types::EntryType, null: false do
      argument :id, ID, required: true
      description 'Returns one Entry based on its ID.'
    end

    def entry(id:)
      Entry.find(id)
    end
    #? ////////////////////////////////////////////////////////
    #* /////////////////////////////////////////////////////////
  end
end
