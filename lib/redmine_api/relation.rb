module RedmineApi
    class Relation < RedmineApi::Base
        self.prefix = '/issues/1/'

        def self.issue_id issue_id
            self.prefix = '/issues/' + issue_id.to_s + '/'
        end
    end
end