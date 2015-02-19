require 'apilint'

module Apilint
  module Lint
    describe ReturnResource do
      describe '#check' do
        let(:req) { Apilint::Request.new('http://foo.com', '/foo/123.json') }

        context 'with empty response' do
          let(:lint) { ReturnResource.new }
          let(:resp) { Apilint::Response.new(200, [], "[]") }

          before { lint.check(req, resp) }
          it "should not add an offense" do
            expect(lint.offenses).to be_empty
          end
        end

        context 'with non empty response with resources' do
          let(:lint) { ReturnResource.new }
          let(:resp) { Apilint::Response.new(200, [], '[{"id":26}, {"id":34}]') }

          before { lint.check(req, resp) }
          it "should not add an offense" do
            expect(lint.offenses).to be_empty
          end
        end

        context 'with non empty response without resources' do
          let(:lint) { ReturnResource.new }
          let(:resp) { Apilint::Response.new(200, [], '[{"lala":26}, {"noniano":34}]') }

          before { lint.check(req, resp) }
          it "should not add an offense" do
            expect(lint.offenses).to_not be_empty
          end
        end

        # context 'with invalid uri path' do
        #   let(:resp) { Apilint::Response.new(200, [], "{ ") }
        #   let(:lint) { ReturnResource.new }

        #   before  { lint.check(req, resp) }

        #   it "should add an offense" do
        #     expect(lint.offenses).to_not be_empty
        #   end
        # end

      end
    end
  end
end
