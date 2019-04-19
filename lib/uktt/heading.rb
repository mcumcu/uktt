module Uktt
  # A Chapter object for dealing with an API resource
  class Heading
    attr_accessor :host, :version, :return_json, :heading_id, :debug

    def initialize(heading_id,
                   json = false,
                   host = api_host,
                   version = spec_version,
                   debug = false)
      @host = host
      @version = version
      @heading_id = heading_id
      @return_json = json
      @debug = debug
    end

    def retrieve
      resource = "#{HEADING}/#{@heading_id}.json"
      Uktt::Http.new(@host, @version, @debug).retrieve(resource, @return_json)
    end
  end
end
