class CreateDisciplineGroupsTable < ActiveRecord::Migration
  def change
    create_table :disciplines_groups, :id => false do |t|
        t.references :discipline
        t.references :group
    end
  end
end
