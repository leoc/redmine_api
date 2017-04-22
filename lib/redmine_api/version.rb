module RedmineApi
  class Version < RedmineApi::Base
    self.prefix = '/projects/'

    def self.project_id(project_id)
      self.prefix = "/projects/#{project_id}/"
      self
    end

    def self.for_project(project_id)
      project_id(project_id)
    end

    def self.find_all(options = {})
      results = []
      results_query = RedmineApi::Version.find(:all, options)
      results.push(*results_query)
      while results_query.next_page?
        results_query = results_query.next_page
        results.push(*results_query)
      end
      results
    end
  end
end
