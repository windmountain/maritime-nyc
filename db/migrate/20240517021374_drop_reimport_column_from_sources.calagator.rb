# frozen_string_literal: true

# This migration comes from calagator (originally 20150702171204)
class DropReimportColumnFromSources < ActiveRecord::Migration[4.2]
  def self.up
    remove_column :sources, :reimport
  end

  def self.down
    add_column :sources, :reimport, :boolean
  end
end
