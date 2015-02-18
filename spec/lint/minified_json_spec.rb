require 'apilint'

module Apilint
  module Lint
    describe MinifiedJson do
      describe '#check' do
        let(:req) { Apilint::Request.new('http://foo.com', '/foo/123.json') }

        context 'with correctly minified json' do
          let(:lint) { MinifiedJson.new }
          let(:resp) { Apilint::Response.new(200, [], "{}") }

          before { lint.check(req, resp) }

          it "should not add an offense" do
            expect(lint.offenses).to be_empty
          end
        end

        context 'with invalid uri path' do
          let(:resp) { Apilint::Response.new(200, [], "{   }") }
          let(:lint) { MinifiedJson.new }

          before  { lint.check(req, resp) }

          it "should add an offense" do
            expect(lint.offenses).to_not be_empty
          end
        end
      end
    end
  end
end
