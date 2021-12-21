# Admins
Admin.create(email: 'renato@am4zon.com', password: '123123')

# User
User.create(email: 'user@gmail.com', password: '123123')

# Authors
jk_rowling = Author.create(name: 'J.K. Rowling', citizenship: 'British')
ayn_rand = Author.create(name: 'Ayn Rand', citizenship: 'Russian')
jrr_tolkien = Author.create(name: 'J.R.R. Tolkien',
                            citizenship: 'South African')
plato = Author.create(name: 'Plato', citizenship: 'Greek')

# Genres

fantasy = Genre.create(title: 'Fantasy')
fiction = Genre.create(title: 'Fiction')
philosophy = Genre.create(title: 'Philosophy')
# Books
Book.create(title: 'Harry Potter and the prisoner of Azkaban',
            description: 'Third title of the series',
            author: jk_rowling, genre: fantasy)
Book.create(title: 'The Fountainhead',
            description: 'One of Rands greatest novels',
            author: ayn_rand, genre: fiction)
Book.create(title: 'The Lord of the Rings: Return of the King',
            description: 'The third and final volume of the series',
            author: jrr_tolkien, genre: fantasy)
Book.create(title: 'The Republic', 
            description: 'A Socratic dialogue, concerning justice ',
            author: plato, genre: philosophy)