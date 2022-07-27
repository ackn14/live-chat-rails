class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      # userテーブルへの関連付け
      t.references :user
      # contentカラムをstring型で作成
      t.string :content
      # created_atとupdated_atを作成
      t.timestamps
    end
  end
end
