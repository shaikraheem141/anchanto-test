class CreateIxamsQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :ixams_questions, id: false do |t|
      t.belongs_to :ixam
      t.belongs_to :question
    end
  end
end
