require 'spec_helper'
require 'apilint/response'

RSpec.describe Apilint::Response do
  describe "Response" do
    describe "#parse_body" do
      context 'with an empty body' do
        let(:res){ Apilint::Response.new(200, [], "")}

        it 'returns an empty hash for empty responses' do
          expect(res.parse_body("json")).to be_empty
          expect(res.parse_body("xml")).to be_empty
        end

      end

      context 'with a non empty body' do
        let(:res_json){ Apilint::Response.new(200, [], '{"id":42}')}
        let(:res_xml){ Apilint::Response.new(200, [], '<?xml version=\"1.0\" encoding=\"UTF-8\"?><application><id>706</id></application>')}

        it 'follows the parameter guidance for format' do
          expect(res_json.parse_body("json")).to_not be_empty
          expect(res_xml.parse_body("xml")).to_not be_empty
        end

      end
    end
  end
end
