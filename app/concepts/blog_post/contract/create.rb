# app/concepts/blog_post/contract/create.rb

require 'reform/form/dry'

module BlogPost::Contract
  class Create < Reform::Form
    include Dry

    property :title
    property :body

    validation do
      params do
        required(:title).filled
        required(:body).maybe(min_size?: 9)
      end
    end
  end
end