class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.text :content
      t.datetime :post_time
      t.bigint :user_id

      t.timestamps
    end
  end
end
