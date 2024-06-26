# frozen_string_literal: true

# This migration comes from calagator (originally 8)
class AddSourceIdToVenues < ActiveRecord::Migration[4.2]
  def self.up
    add_column :venues, :source_id, :integer
  end

  def self.down
    remove_column :venues, :source_id
  end
end
