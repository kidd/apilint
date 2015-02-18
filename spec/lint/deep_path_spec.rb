require 'apilint'

module Apilint
  module Lint
    describe DeepPath do
      describe '#check' do
        let(:resp) { Apilint::Response.new }

        context 'with basic uri path' do
          let(:req) { Apilint::Request.new('http://foo.com', '/foo/123.json') }
          let(:lint) { DeepPath.new }

          before { lint.check(req, resp) }

          it "should not add an offense" do
            expect(lint.offenses).to be_empty
          end
        end

        context 'with invalid uri path' do
          let(:req) { Apilint::Request.new('http://foo.com', '/foo/123/bar/456.json') }
          let(:lint) { DeepPath.new }

          before  { lint.check(req, resp) }

          it "should add an offense" do
            expect(lint.offenses).to_not be_empty
          end
        end
      end
    end
  end
end
