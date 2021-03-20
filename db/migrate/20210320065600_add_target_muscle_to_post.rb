class AddTargetMuscleToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :target_muscle, :string
  end
end
