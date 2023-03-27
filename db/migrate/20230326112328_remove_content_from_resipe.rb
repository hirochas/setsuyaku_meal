class RemoveContentFromResipe < ActiveRecord::Migration[6.1]
  def change
    remove_column :resipes, :stauts, :string
  end
end
