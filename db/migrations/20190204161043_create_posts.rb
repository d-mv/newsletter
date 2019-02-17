Hanami::Model.migration do
  change do
    create_table :posts do
      primary_key :id
      foreign_key :source_id, :sources, on_delete: :cascade, null: false

      column :title, String
      column :text, String
      column :url, String
      column :author, String
      column :star, TrueClass, default: false
      column :published, DateTime
      column :words, Integer
      column :status, TrueClass, default: true
      # auto-generated
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
