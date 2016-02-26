require_relative 'quiz'

describe HtmlDocument do

	describe '#meta_keywords' do
		let(:parser) { double }
		before { @doc = HtmlDocument.new(parser)}

		it 'gets meta keywords' do
			expect(parser).to receive(:get_meta_tag)
			@doc.meta_keywords
		end

		it 'returns content' do
			tag = double
			allow(tag).to receive(:attribute).and_return("hello world")
			allow(parser).to receive(:get_meta_tag).and_return(tag)
			expect(@doc.meta_keywords).to eql(["hello world"])
		end

		it 'strips and splits content' do
			tag = double
			allow(tag).to receive(:attribute).and_return("hello world, hi       ")
			allow(parser).to receive(:get_meta_tag).and_return(tag)
			expect(@doc.meta_keywords).to eql(["hello world", "hi"])			
		end

	end
end