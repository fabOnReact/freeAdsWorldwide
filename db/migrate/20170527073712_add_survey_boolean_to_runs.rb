class AddSurveyBooleanToRuns < ActiveRecord::Migration[5.0]
  def change
    add_column :runs, :survey, :boolean
  end
end
