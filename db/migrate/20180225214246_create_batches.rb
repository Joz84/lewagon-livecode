class CreateBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :batches do |t|
      t.integer :number

      t.timestamps
    end
  end
end
