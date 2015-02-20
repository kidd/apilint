require 'spec_helper'

module Apilint
  module Lint
    describe IncludeTimestamps do
      describe '#check' do
        let(:lint) { IncludeTimestamps.new }
        let(:req)  { Apilint::Request.new('http://foo.com', '/foo/123.json') }

        context 'with empty response' do
          let(:resp) { Apilint::Response.new(200, [], "[]") }

          before { lint.check(req, resp) }
          it "should not add an offense" do
            expect(lint.offenses).to be_empty
          end
        end

        context 'with resource without timestamps' do
          let(:resp) { Apilint::Response.new(200, [], '[{"lala":26}, {"noniano":34}]') }

          before { lint.check(req, resp) }
          it "should not add an offense" do
            expect(lint.offenses).to_not be_empty
          end
        end

        context 'with resource without timestamps' do
          let(:resp) { Apilint::Response.new(200, [], '[{"lala":26}, {"noniano":34}]') }

          before { lint.check(req, resp) }
          it "should add an offense" do
            expect(lint.offenses).to_not be_empty
          end
        end

        context 'with resource with timestamps' do
          let(:resp) { Apilint::Response.new(200, [], '[{"lala":26, "created_at": "222", "updated_at": "30003"}, {"noniano":34", "created_at": "222", "updated_at": "30003"}]') }

          before { lint.check(req, resp) }
          it "should not add an offense" do
            expect(lint.offenses).to be_empty
          end
        end
      end
    end
  end
end
