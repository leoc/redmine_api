module RedmineApi
    class Membership < RedmineApi::Base

        def self.project project_name
            self.prefix = '/projects/' + project_name + '/'
        end
    end
end