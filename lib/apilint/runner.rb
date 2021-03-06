require 'json'

module Apilint
  class Runner
    def initialize(opts = {})
      if opts[:config_file]
        @config = Config.load_from_file(opts[:config_file])
      else
        @config = Config.new
      end
    end

    def run(file)
      requests = load_requests(file)
      inspect_requests(requests)
    end

    private

    def load_requests(file)
      requests_json = JSON.parse(File.read(file))

      requests_json.map do |json_pair|
        [parse_request(json_pair["request"]), parse_response(json_pair["response"])]
      end
    end

    def inspect_requests(requests)
      reporter   = Reporter.create_reporter(OffenseBasedRep)
      reporter.num_requests = requests.size
      all_passed = true

      requests.each do |request, response|
        offenses = inspect_request(request, response)
        reporter.report(offenses)
        all_passed &&= offenses.empty?
      end

      reporter.flush
      all_passed
    end

    def inspect_request(request, response)
      Linter.all.each_with_object([]) do |lint_klass, offenses|
        lint = lint_klass.new(@config)
        next unless lint.enabled?
        lint.check(request, response)

        offenses.concat(lint.offenses)
      end
    end

    def parse_request(raw_request)
      Request.new(raw_request["headers"]["HTTP_HOST"], raw_request["path"])
    end

    def parse_response(raw_response)
      Response.new(raw_response["code"], raw_response['headers'], raw_response["body"])
    end
  end
end
