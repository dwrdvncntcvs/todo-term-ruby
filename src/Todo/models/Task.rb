require "securerandom"
require "base64"

class Task
    attr_reader :id, :description, :is_done, :created_at, :updated_at

    def initialize(description, is_done)
        @id = Base64.
            urlsafe_encode64(SecureRandom.
                random_bytes(8), padding: false)
        @description = description
        @is_done = is_done
        @created_at = Time.now
        @updated_at = Time.now
    end
end