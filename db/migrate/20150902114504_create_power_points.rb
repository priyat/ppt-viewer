class CreatePowerPoints < ActiveRecord::Migration
  def change
    create_table :power_points do |t|
      t.text :name
      t.string :output_path
      t.string :file_name
      t.string :file_size
      t.string :file_type

      t.timestamps null: false
    end
  end
end
