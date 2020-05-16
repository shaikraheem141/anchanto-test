class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :gtext
      t.string :gtype

      t.timestamps
    end
  end
end
