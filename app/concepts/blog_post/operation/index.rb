module BlogPost::Operation
  class Index < Trailblazer::Operation
    step :find_all

    def find_all(ctx, **)
      ctx[:model] = ::Blogpost.all.reverse_order
    end
  end
end