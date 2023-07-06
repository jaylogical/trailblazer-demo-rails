# app/concepts/blog_post/operation/delete.rb
module BlogPost::Operation
  class Delete < Trailblazer::Operation
    step Model(Blogpost, :find_by)
    step :delete

    def delete(ctx, model:, **)
      model.destroy
    end
  end
end