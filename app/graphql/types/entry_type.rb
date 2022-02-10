module Types
  class EntryType < Types::BaseObject


    field :id, ID, null: false
    field :galaxy, String, null: true
    field :region, String, null: true
    field :planet_names, String, null: true 
    field :glyphs, String, null: true
    field :dominant_lifeform, String, null: true
    field :economy, String, null: true
    field :conflict_level, String, null: true
    field :notes, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :logged_by, UserType, null: true, method: :user
  end
end
# field :user_id, Types::UserType, null: true
