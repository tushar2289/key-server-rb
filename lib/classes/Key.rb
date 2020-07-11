require 'securerandom'

class Key
  attr_reader :id
  attr_reader :created_on
  attr_accessor :validity_started_on
  attr_accessor :refresh_count

  def initialize
    @id = SecureRandom.uuid
    @created_on = Time.now
    @validity_started_on = Time.now
    @refresh_count = 0
  end

  def refresh
    @validity_started_on = Time.now
    @refresh_count += 1
  end
end