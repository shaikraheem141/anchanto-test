class DropIxamsQuestionsTablesTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :ixams_questions_tables
  end
end
