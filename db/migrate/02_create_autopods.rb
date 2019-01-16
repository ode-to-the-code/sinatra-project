class CreateAutopods < ActiveRecord::Migration
  def change
    create_table :autopods do |t|
      t.string :pod_name
      t.integer :rider_id
    end
  end
end
