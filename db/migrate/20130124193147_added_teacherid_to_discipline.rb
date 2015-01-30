class AddedTeacheridToDiscipline < ActiveRecord::Migration
  def change
    add_column :disciplines, :teacher_id, :integer
  end
end
