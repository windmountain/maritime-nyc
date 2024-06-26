# frozen_string_literal: true

# This migration comes from calagator (originally 14)
class RemoveFormatTypeFromSource < ActiveRecord::Migration[4.2]
  def self.up
    remove_column :sources, :format_type
  end

  def self.down
    add_column :sources, :format_type, :string
  end
end
