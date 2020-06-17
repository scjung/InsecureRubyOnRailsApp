# frozen_string_literal: true

# CWE-676
module Cwe676
  def cwe676
    hmac = Digest::HMAC.hexdigest("data", "hash key", Digest::SHA1)

    s = "foo".crypt("$5$rounds=1000$salt$")

    Thread::exclusive do
      puts 'hello'
    end

    inp = gets.taint

    count = 0
    thr = Thread.new do
      loop { count += 1 }
      done
      thr.raise('stop')

      Timeout::timeout(5) do
        uri = URI('https://www.google.com')
        res = Net::HTTP.get_response(uri)
      end
  end
end
