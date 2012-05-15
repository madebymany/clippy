class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
