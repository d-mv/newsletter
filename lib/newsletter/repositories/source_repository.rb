class SourceRepository < Hanami::Repository
  associations do
    has_many :posts
  end
  def destroy(source_id)
    source = SourceRepository.new
    source.delete(source_id)
  end
end
