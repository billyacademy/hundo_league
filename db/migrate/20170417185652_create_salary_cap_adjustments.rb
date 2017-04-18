class CreateSalaryCapAdjustments < ActiveRecord::Migration[5.0]
  def change
    create_table :salary_cap_adjustments do |t|
      t.integer :cap_recipient_id
      t.integer :cap_sender_id
      t.integer :year
      t.integer :cap_adjustment
      t.text :comments
    end
  end
end
