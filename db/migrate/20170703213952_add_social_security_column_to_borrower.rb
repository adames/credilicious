class AddSocialSecurityColumnToBorrower < ActiveRecord::Migration[5.1]
  def change
    add_column :borrowers, :social_security, :bigint
  end
end
