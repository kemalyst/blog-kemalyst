require "crypto/md5"
include Kemalyst

module SessionController
  
  class New < Controller
    def call(context)
      authorized = context.session.has_key?("authorized")
      render "session/new.ecr", "main.ecr"
    end
  end

  class Create < Controller
    def call(context)
      authorized = context.session.has_key?("authorized")
      username = context.params["username"]
      password = context.params["password"]

      # puts "Encrypted Password: #{Crypto::MD5.hex_digest(password as String)}"
      if username == "admin" && Crypto::MD5.hex_digest(password as String) == "ff2fca5e688561ed5237c9a9445c427a"
        context.session["authorized"] = "true"
      end
      redirect "/"
    end
  end

  class Delete < Controller
    def call(context)
      authorized = context.session.has_key?("authorized")
      context.clear_session
      redirect "/"
    end
  end

end

