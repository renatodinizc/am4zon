[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

# Am4zon
The Am4zon project is in essence a clone website from the original Amazon®.

This is the first of a two-part project, consisting of a book retail store and
a payment platform which will handles all processing and buyer authentication
related functionality via API RESTful.

In the Am4zon platform, users can easyly access all books by genre and author,
search through our entire database via the menu search box and access book
collections tailored by our specialists.

Users can buy individual books or get some discount buying through collections.
You can encounter promotions on books a few months after its entry onto the
platform, and everynow and then we will liberate promotion coupons! So get ready
to enrich you library because we will get you some really good stuff at an
awesome pricing.

This is Am4zon, your new favorite online bookstore.


## Architeture e main models

The application is currently composed of 3 main models: Admin, User, Book

* The models 'Admin' and 'User' are devise models to access the platform.
  Admins are the ones capable of add Books, Genres, Authors and Book Collections
  to the platform while Users are the ones capable of selecting and carry out
  purchase orders.
* The model 'Book' holds the information regarding its author and genre,
  having a description and other information to look for.

Architeture

* The application follows a MVC architeture, where the single
  responsiblity principle is followed.

## Other models

The project includes other set of models that add to the application
capabilities. Those are listed as follows:
* Author
* Genre

## Implemented features so far

* Admin and User can create account on platform informing e-mail and a password.
* Authenticated Admin can register a new Genre, Author and Book onto platform
* A book must contain it's title, description, author and genre detailed.
* Admin can create a collection of books which must contain at least three
  unique books, a title and it's description.
* User can visualize and update own personal profile with additional info.

## Install and startup

Install instructions

* Download repo

```
git clone git@github.com:renatodinizc/final_project_renato_td7
cd final_project_renato_td7
```

* Check ruby version

`ruby -v`

The result must start with `ruby 3.0.2`

In case of difference in version, install the version last referred with rbenv

`rbenv install 3.0.2`

Install dependencies with bundle and yarn

`bundle && yarn`

Initialize server
`rails s`

Startup instructions

The application comes with a seeds file populated with the corresponding models
for immediate execution:

* Two Admins accounts
  - email: renato@am4zon.com | password: 123123
  - email: admin@am4zon.com | password: 123123
* Two Users accounts
  - email: joao@gmail.com | password: 123123
  - email: user@gmail.com | password: 123123
* Five Authors
  - J.K. Rowling
  - Ayn Rand
  - J.R.R. Tolkien
  - Plato
  - James Stewart
  - Frank M. White
* Four Genres
  - Fantasy
  - Fiction
  - Philosophy
  - Engineering
* Nine Books
  - Harry Potter and the Sorcerer's Stone
  - Harry Potter and the Chamber of Secrets
  - Harry Potter and the Prisoner of Azkaban
  - Harry Potter and the Goblet of Fire
  - Harry Potter and the Order of the Phoenix
  - Harry Potter and the Half-Blood Prince
  - Harry Potter and the Deathly Hallows
  - The Lord of the Rings: Fellowship of the ring
  - The Lord of the Rings: Two Towers
  - The Lord of the Rings: Return of the King
  - The Fountainhead
  - The Republic
  - Essential Calculus with Differential Equations
  - Fluid Mechanics
* Two Book Collections
 - The wizardry series collection
 - The Middle-earth collection

# Gems, dependencies and versions

* Ruby version 3.0.2p107 (2021-07-07 revision 0db68f0233) [arm64-darwin20]

* Rails version 6.1.4.1

* System dependencies Mac OS Big Sur 11.6 ARMx86-64bits

* Database creation Sqlite3

* Database initialization Sqlite3

* SimpleCov - code coverage for Ruby

* FactoryBot

* Devise authentication solution

* Rubocop linter and code formatter