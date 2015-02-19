require 'apilint'

module Apilint
  module Lint
    describe RateLimitStatus do
      let(:lint) { RateLimitStatus.new }
      let(:req)  { Apilint::Request.new('http://foo.com', '/foo/123.json') }

      describe '#check' do
        context 'with a response containing rate limit status headers' do
          let(:resp) { Response.new(200, { "RateLimit-Remaining" => "20" }, "") }

          before { lint.check(req, resp) }
          it "should not add an offense" do
            expect(lint.offenses).to be_empty
          end
        end

        context 'with a response without rate limit status headers' do
          let(:resp) { Response.new(200, { "Foo" => "20" }, "") }

          before { lint.check(req, resp) }
          it "should add an offense" do
            expect(lint.offenses).to_not be_empty
          end
        end
      end
    end
  end
end
