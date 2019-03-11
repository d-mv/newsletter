Hanami::Model.migration do
  change do
    create_table :sources do
      primary_key :id
      column :name, String, null: false, unique: true, size: 100
      column :url, String, null: false, unique: true
      # auto-generated
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
