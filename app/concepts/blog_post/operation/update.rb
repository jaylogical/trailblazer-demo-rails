# app/concepts/blog_post/operation/update.rb
module BlogPost::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Blogpost, :find_by)
      step Contract::Build(constant: BlogPost::Contract::Create)
    end

    step Subprocess(Present)
    step Contract::Validate(key: :blog_post)
    step Contract::Persist()
  end
end