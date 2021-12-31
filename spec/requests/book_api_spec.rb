require 'rails_helper'

describe 'Book API' do
  context 'GET /api/v1/books' do
    it 'should get books sucessfully' do
      create(:book, title: 'Sherlock Holmes: The Hound of the Baskervilles')
      create(:book, title: 'Sherlock Holmes: The Sign of the Four')

      get '/api/v1/books'

      expect(response).to have_http_status 200
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body.first[:title])
        .to eq 'Sherlock Holmes: The Hound of the Baskervilles'
      expect(parsed_body.second[:title])
        .to eq 'Sherlock Holmes: The Sign of the Four'
      expect(parsed_body.count).to eq 2
    end

    it 'should return no books if there arent any successfully' do
      get '/api/v1/books'

      expect(response).to have_http_status 200
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body).to be_empty
    end
  end

  context 'GET api/v1/book/:id' do
    it 'should get specific book successfully' do
      book = create(:book,
                    title: 'Sherlock Holmes: The Hound of the Baskervilles')

      get "/api/v1/books/#{book.id}"

      expect(response).to have_http_status 200
      expect(response.content_type).to include 'application/json'
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body[:title])
        .to eq 'Sherlock Holmes: The Hound of the Baskervilles'
    end
  end
end
