# app/concepts/blog_post/operation/show.rb
module BlogPost::Operation
  class Show < Trailblazer::Operation
    step Model(Blogpost, :find_by)
  end
end