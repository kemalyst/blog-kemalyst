require "../models/post"
include Kemalyst

module ApiController
  class Show < Controller
    def call(context)
      id = context.params["id"]
      post = Post.find(id)
      if post
        json post, 200
      else
        json %({"error":"#{id} could not be found""}), 404
      end
    end
  end
end

