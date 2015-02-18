require 'apilint/linter'
require 'apilint/lint/downcase_path'

module Apilint
  module Lint
    describe DowncasePath do
      describe '#check' do
        let(:resp) { Apilint::Response.new }

        context 'with valid uri path' do
          let(:req) { Apilint::Request.new('http://foo.com', '/foo-bar.html') }
          let(:lint) { DowncasePath.new }

          before { lint.check(req, resp) }

          it "should not add an offense" do
            expect(lint.offenses).to be_empty
          end
        end

        context 'with invalid uri path' do
          let(:req) { Apilint::Request.new('http://foo.com', '/FooBar.html') }
          let(:lint) { DowncasePath.new }

          before { lint.check(req, resp) }

          it "should add an offense" do
            expect(lint.offenses).to_not be_empty
          end
        end
      end
    end
  end
end
