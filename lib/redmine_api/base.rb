module RedmineApi
  class Base < ActiveResource::Base
    self.format = :xml
    def self.configure
      yield self
    end

    def self.token(token)
      self.headers['X-Redmine-API-Key'] = token
    end
  end
end
