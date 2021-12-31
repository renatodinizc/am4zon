# Admins
Admin.create(email: 'renato@am4zon.com', password: '123123')
Admin.create(email: 'admin@am4zon.com', password: '123123')

# User
User.create(email: 'user@gmail.com', password: '123123')
User.create(email: 'joao@gmail.com', password: '123123')

# Authors
jk_rowling = Author.create(name: 'J.K. Rowling', citizenship: 'British')
ayn_rand = Author.create(name: 'Ayn Rand', citizenship: 'Russian')
jrr_tolkien = Author.create(name: 'J.R.R. Tolkien',
                            citizenship: 'South African')
plato = Author.create(name: 'Plato', citizenship: 'Greek')
james_stewart = Author.create(name: 'James Stewart', citizenship: 'Canadian')
frank_white = Author.create(name: 'Frank M. White', citizenship: 'American')

# Genres

fantasy = Genre.create(title: 'Fantasy')
fiction = Genre.create(title: 'Fiction')
philosophy = Genre.create(title: 'Philosophy')
engineering = Genre.create(title: 'Engineering')

# Books
hp_stone = Book.create(title: "Harry Potter and the Sorcerer’s Stone",
                       description: 'First title of the series',
                       author: jk_rowling, genre: fantasy)
hp_chamber = Book.create(title: 'Harry Potter and the Chamber of Secrets ',
                         description: 'Second title of the series',
                         author: jk_rowling, genre: fantasy)
hp_azkaban = Book.create(title: 'Harry Potter and the Prisoner of Azkaban',
                         description: 'Third title of the series',
                         author: jk_rowling, genre: fantasy)
hp_goblet = Book.create(title: 'Harry Potter and the Goblet of Fire',
                        description: 'Fourth title of the series',
                        author: jk_rowling, genre: fantasy)
hp_phoenix = Book.create(title: 'Harry Potter and the Order of the Phoenix',
                         description: 'Fifth title of the series',
                         author: jk_rowling, genre: fantasy)
hp_prince = Book.create(title: 'Harry Potter and the Half-Blood Prince',
                        description: 'Sixth title of the series',
                        author: jk_rowling, genre: fantasy)
hp_hallows = Book.create(title: 'Harry Potter and the Deathly Hallows',
                         description: 'Seventh title of the series',
                         author: jk_rowling, genre: fantasy)
lotr_flw = Book.create(title: 'The Lord of the Rings: Fellowship of the ring',
                          description: 'The first volume of the series',
                          author: jrr_tolkien, genre: fantasy)
lotr_tt = Book.create(title: 'The Lord of the Rings: Two Towers',
                            description: 'The second volume of the series',
                            author: jrr_tolkien, genre: fantasy)
lotr_king = Book.create(title: 'The Lord of the Rings: Return of the King',
                        description: 'The third and final volume of the series',
                        author: jrr_tolkien, genre: fantasy)
Book.create(title: 'The Fountainhead',
            description: 'One of Rands greatest novels',
            author: ayn_rand, genre: fiction)
Book.create(title: 'The Republic', 
            description: 'A Socratic dialogue concerning justice ',
            author: plato, genre: philosophy)
Book.create(title: 'Essential Calculus with Differential Equations',
            description: 'Introduces inequalities, induction and other topics',
            author: james_stewart, genre: engineering)
Book.create(title: 'Fluid Mechanics',
            description: 'The study of fluids as a major branch of engineering',
            author: frank_white, genre: engineering)

# BookCollections
BookCollection.create(title: 'The wizardry series collection',
                      description: 'All books from the Harry Potter saga',
                      book1: hp_stone, book2: hp_chamber, book3: hp_azkaban,
                      book4: hp_goblet, book5: hp_phoenix, book6: hp_prince,
                      book7: hp_hallows)
BookCollection.create(title: 'The Middle-earth collection',
                      description: 'The fantasy trilogy that defined a genre',
                      book1: lotr_flw, book2: lotr_tt, book3: lotr_king)
