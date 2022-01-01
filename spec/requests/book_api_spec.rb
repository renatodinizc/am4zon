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

    it 'should return 500 if db is not avaiable' do
      allow(Book).to receive(:all)
        .and_raise(ActiveRecord::ConnectionNotEstablished)

      get '/api/v1/books'

      expect(response).to have_http_status 503
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

    it 'book requested does not exist on db' do
      get '/api/v1/books/14'

      expect(response).to have_http_status 404
      expect(response.content_type).to include 'application/json'
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body[:message]).to eq 'Book has not been found'
    end

    it 'should return 500 if db is unavailable' do
      book = create(:book,
                    title: 'Sherlock Holmes: The Hound of the Baskervilles')
      allow(Book).to receive(:find)
        .and_raise(ActiveRecord::ConnectionNotEstablished)

      get "/api/v1/books/#{book.id}"

      expect(response).to have_http_status 503
      expect(response.content_type).to include 'application/json'
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body[:message]).to eq 'db seems to be unavailable'
    end
  end

  context 'POST /api/v1/books' do
    it 'should save a new book' do
      create(:author, name: 'Arthur Conan Doyle')
      create(:genre, title: 'Detective')

      book_params = { book:
                      { title: 'Sherlock Holmes: The Hound of the Baskervilles',
                        description: 'The third of the four crime novels',
                        price: 28.5,
                        sale: false,
                        author_id: 1,
                        genre_id: 1 } }
      post '/api/v1/books', params: book_params

      expect(response).to have_http_status 201
      expect(response.content_type).to include 'application/json'
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body[:title])
        .to eq 'Sherlock Holmes: The Hound of the Baskervilles'
      expect(parsed_body[:description])
        .to eq 'The third of the four crime novels'
      expect(parsed_body[:price]).to eq '28.5'
    end

    it 'should return 500 if db is unavailable' do
      create(:author, name: 'Arthur Conan Doyle')
      create(:genre, title: 'Detective')
      allow(Book).to receive(:create)
        .and_raise(ActiveRecord::ConnectionNotEstablished)

      book_params = { book:
                      { title: 'Sherlock Holmes: The Hound of the Baskervilles',
                        description: 'The third of the four crime novels',
                        price: 28.5,
                        sale: false,
                        author_id: 1,
                        genre_id: 1 } }
      post '/api/v1/books', params: book_params

      expect(response).to have_http_status 503
      expect(response.content_type).to include 'application/json'
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body[:message]).to eq 'db seems to be unavailable'
    end
  end
end
