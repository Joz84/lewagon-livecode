class CreateBatchTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :batch_teachers do |t|
      t.references :user, foreign_key: true
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
