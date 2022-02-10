module Mutations
  class UpdateEntry < BaseMutation

    field :entry, Types::EntryType, null: true
    
    field :errors, [String], null: false
    
    # ID argument is required to update an entry
    argument :id, ID, required: true

    # updatabloe arguments that are not required
    argument :galaxy, String, required: false
    argument :region, String, required: false
    argument :glyphs, [String], required: false
    argument :planet_names, [String], required: false
    argument :dominant_lifeform, String, required: false
    argument :economy, String, required: false
    argument :conflict_level, String, required: false
    argument :notes, String, required: false
    
    # type Types::EntryType

    # def resolve(id:, galaxy:, region:, glyphs:, planet_names:, dominant_lifeform:, economy:, conflict_level:, notes:)
    def resolve(id:, **args)
      entry = Entry.find(id)

      if entry.update(args)
        {
          entry: entry,
          errors: []
        }
      else
        {
          entry: nil,
          errors: entry.errors.full_messages
        }
      end
    end
  end
end
