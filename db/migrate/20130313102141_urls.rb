class Urls < ActiveRecord::Migration
  def change
    create_table(:urls) do |t|
      t.string  :original, :shortened
      t.integer :visits, :default => 0
      t.timestamps
    end
  end
end
