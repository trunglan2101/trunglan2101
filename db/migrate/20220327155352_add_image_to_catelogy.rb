class AddImageToCatelogy < ActiveRecord::Migration[6.1]
  def change
    add_column :catelogies, :image, :string
  end
end
