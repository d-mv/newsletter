# frozen_string_literal: true

# require 'pry-byebug'
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

  def find_by_uid(uid)
    posts.where(uid: uid)
    # binding.pry
    # end
  end

  def sorted_new
    posts.where(status: true).order { published.desc }
  end

  def destroy(id)
    posts = PostRepository.new
    post = posts.update(id, title: '', text: '', url: '', author: '', star: false, words: '', status: false)
  end

  def star(id)
    posts = PostRepository.new
    # binding.pry
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
