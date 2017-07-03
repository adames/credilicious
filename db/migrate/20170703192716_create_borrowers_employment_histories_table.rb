class CreateEmploymentHistoriesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :employment_histories do |t|
      t.integer  :borrower_id
      t.integer  :employer_id
      t.float    :salary
      t.date     :start_date
      t.date     :end_date
      t.string   :job_title
    end
  end
end
