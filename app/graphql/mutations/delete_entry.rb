module Mutations
  class DeleteEntry < BaseMutation
    field :entry, Types::EntryType, null: true
    field :errors, [String], null: false

    argument :id, ID, required: true

    type Types::EntryType


    def resolve(id:)
      entry = Entry.find(id)
      return { error: "entry does not exist" } unless entry
      entry.destroy!
      return { message: "deletion successfull" }
    end
  end
end
