class RemovePlanFromTenants < ActiveRecord::Migration
  def change
    remove_column :tenants, :plan, :string
  end
end
