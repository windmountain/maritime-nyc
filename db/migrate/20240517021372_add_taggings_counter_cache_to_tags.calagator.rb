# frozen_string_literal: true

# This migration comes from calagator (originally 20150407014752)
class AddTaggingsCounterCacheToTags < ActiveRecord::Migration[4.2]
  def self.up
    add_column :tags, :taggings_count, :integer, default: 0

    ActsAsTaggableOn::Tag.reset_column_information
    ActsAsTaggableOn::Tag.find_each do |tag|
      ActsAsTaggableOn::Tag.reset_counters(tag.id, :taggings)
    end
  end

  def self.down
    remove_column :tags, :taggings_count
  end
end
