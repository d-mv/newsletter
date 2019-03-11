# frozen_string_literal: true

class PostRepository < Hanami::Repository
  associations do
    belongs_to :source
    has_one :source
  end

  def post_of(post, _id)
    assoc(:sources, post)
  end

  def active_posts
    posts.where(status: true)
  end

  def find_by_url(url)
    posts.where(url: url)
  end

  def sorted_new
    posts.where(status: true).order { published.desc }
  end

  def destroy(id)
    posts = PostRepository.new
    post = posts.update(id, title: '', text: '', author: '', star: false, words: 0, status: false)
  end

  def star(id)
    posts = PostRepository.new
    post = if posts.find(id).star
             posts.update(id, star: false)
           else
             posts.update(id, star: true)
           end
  end

  def find_by_source(sid)
    posts.where(status: true, source_id: sid).order { published.desc }
  end
end
