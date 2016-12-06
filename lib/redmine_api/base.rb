module RedmineApi
  class Base < ActiveResource::Base
    self.format = :json
    self.include_root_in_json = true
    self.collection_parser = RedmineApi::Collection

    def self.configure
      yield self
    end

    def self.token(token)
      self.headers['X-Redmine-API-Key'] = token
    end
  end
end
