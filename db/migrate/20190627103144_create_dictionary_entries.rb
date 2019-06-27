class CreateDictionaryEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :dictionary_entries do |t|
      t.string :word, index: true, null: false
      t.string :char_sorted_word, index: true, null: false

      t.timestamps
    end
  end
end
