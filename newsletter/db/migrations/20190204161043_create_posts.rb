Hanami::Model.migration do
  change do
    create_table :posts do
      primary_key :id
      foreign_key :source_id, :sources, on_delete: :cascade, null: false

      column :title, String, null: false
      column :text, String, null: false
      column :url, String, null: false
      column :author, String, null: false
      column :star, TrueClass, null: false, default: false
      column :published, DateTime, null: false
      column :words, Integer, null: false
      # auto-generated
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
