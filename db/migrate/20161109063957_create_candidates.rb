class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :qualification
      t.string :college
      t.string :stream

      t.timestamps
    end
  end
end
