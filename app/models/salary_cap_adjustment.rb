class SalaryCapAdjustment < ApplicationRecord
  belongs_to :dynasty_team

  validates :cap_adjustment, numericality: { only_integer: true }
end
