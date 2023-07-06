# app/concepts/blog_post/operation/create.rb
module BlogPost::Operation
  class Create < Trailblazer::Operation
    # Only used to setup the form.
    class Present < Trailblazer::Operation
      step Model(Blogpost, :new)
      step Contract::Build(constant: BlogPost::Contract::Create)
    end

    step Subprocess(Present) # Here, we actually run the {Present} operation.
    step Contract::Validate(key: :blog_post)
    step Contract::Persist()
    step :notify!

    def notify!(ctx, model:, **)
      ctx["result.notify"] = Rails.logger.info("New blog post #{model.title}.")
    end
  end
end