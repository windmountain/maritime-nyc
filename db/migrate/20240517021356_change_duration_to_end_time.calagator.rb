# frozen_string_literal: true

# This migration comes from calagator (originally 20080705163959)
class ChangeDurationToEndTime < ActiveRecord::Migration[4.2]
  def self.up
    add_column :events, :end_time, :datetime
    remove_column :events, :duration
  end

  def self.down
    add_column :events, :duration, :integer
    remove_column :events, :end_time
  end
end
