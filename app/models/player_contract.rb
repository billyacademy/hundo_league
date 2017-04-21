class PlayerContract < ApplicationRecord
  belongs_to :player, primary_key: 'player_id', foreign_key: 'player_id'
  belongs_to :dynasty_team
  belongs_to :contract_type
  accepts_nested_attributes_for :player, :dynasty_team

  validates :player_id,
    presence: true
end
