class RenamePublishYearToPublishedYearInBooks < ActiveRecord::Migration[8.1]
  def change
    rename_column :books, :publish_year, :published_year
  end
end
