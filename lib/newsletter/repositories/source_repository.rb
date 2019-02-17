class SourceRepository < Hanami::Repository
  associations do
    has_many :posts
  end
end
