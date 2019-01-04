class AddAbpToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :abp, :boolean, default: false
    add_index :impressions, :abp
  end
end
