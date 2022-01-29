module Mutations
  class CreateEntry < BaseMutation
    field :entry, Types::EntryType, null: false
    field :errors, [String], null: false

    argument :galaxy, String, required: true
    argument :region, String, required: true
    argument :glyphs, String, required: true
    argument :planets, String, required: false
    argument :dominant_lifeform, String, required: false
    argument :economy, String, required: false
    argument :conflict_level, String, required: false
    argument :notes, String, required: false
    argument :user_id, ID, required: true
    
    
    # TODO: define arguments
    def resolve(galaxy:, region:, glyphs:, planets:, dominant_lifeform:,economy:, conflict_level:, notes:, user_id:)
      entry = Entry.new(galaxy: galaxy, region: region, glyphs: glyphs, planets: planets, dominant_lifeform: dominant_lifeform, economy: economy, conflict_level: conflict_level, notes: notes, user_id: user_id)
      if (entry.save) 
        {
          entry: entry,
          errors: []
        }
      else
        {
          entry: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end

# argument :user, String, required: true , user: User.find_by_name(user)