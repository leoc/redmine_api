module RedmineApi
  class Collection < ActiveResource::Collection
    attr_reader :total_count, :offset, :limit

    def initialize(parsed = {})
      case parsed
      when Array then @elements = parsed
      when Hash then extract_from_hash(parsed)
      else raise 'Wrong parsed data for Collection'
      end
    end

    def extract_from_hash(parsed)
      elements_key = (parsed.keys - %w(total_count offset limit)).first
      @elements = parsed[elements_key]
      @total_count = parsed['total_count']
      @offset = parsed['offset']
      @limit = parsed['limit']
    end

    def next_page?
      @total_count > @offset + @limit
    end

    def next_page
      params = original_params.merge(
        offset: @offset + @limit,
        limit: @limit
      )
      resource_class.find(:all, params: params)
    end
  end
end
