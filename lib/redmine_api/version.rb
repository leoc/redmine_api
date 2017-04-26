module RedmineApi
  class Version < RedmineApi::Base
    self.prefix = "/"

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

    class << self
      def element_path(id, prefix_options = {}, query_options = nil)
        prefix_options, query_options = split_options(prefix_options) if query_options.nil?
        "/#{collection_name}/#{URI.parser.escape id.to_s}#{format_extension}#{query_string(query_options)}"
      end
    end
  end
end
