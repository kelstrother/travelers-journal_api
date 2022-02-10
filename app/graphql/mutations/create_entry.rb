module Mutations
    class CreateEntry < BaseMutation
      
      
      argument :galaxy, String, required: false
      argument :region, String, required: false
      argument :glyphs, [String], required: false
      argument :planet_names, [String], required: false
      argument :dominant_lifeform, String, required: false
      argument :economy, String, required: false
      argument :conflict_level, String, required: false
      argument :notes, String, required: false
      
      type Types::EntryType
      
      def resolve(galaxy: nil,
        region: nil,
        glyphs: nil,
        planet_names: nil, 
        dominant_lifeform: nil, 
        economy: nil, 
        conflict_level: nil, 
        notes: nil)
        
        Entry.create!(
          galaxy: galaxy,
          region: region,
          glyphs: glyphs,
          planet_names: planet_names,
          dominant_lifeform: dominant_lifeform,
          economy: economy,
          conflict_level: conflict_level,
          notes: notes,
          user: context[:current_user]
        )
      end
    end
  end
  # field :create_entry, Types::EntryType, null: false
  # field :errors, [String], null: false
  # entry = Entry.new(galaxy: galaxy, region: region, glyphs: glyphs, planet_names: planet_names, dominant_lifeform: dominant_lifeform, economy: economy, conflict_level: conflict_level, notes: notes)
# if (entry.save) 
#   {
#     entry: entry,
#     errors: []
#   }
# else
#   {
#     entry: nil,
#     errors: entry.errors.full_messages
#   }
# end