# Admins
Admin.create(email: 'renato@am4zon.com', password: '123123')

# User
User.create(email: 'user@gmail.com', password: '123123')

# Authors
author = Author.create(name: 'J.K. Rowling', nationality: 'British')
author2 = Author.create(name: 'Ayn Rand', nationality: 'Russian')

# Books
Book.create(title: 'Harry Potter and the prisoner of Azkaban',
            description: 'Second title of the series',
            author: author)
Book.create(title: 'The Fountainhead',
            description: 'One of Rands greatest novels',
            author: author2)