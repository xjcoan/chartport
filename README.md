#medical-api

"MedLog-API service" (WIP name)

###What is it?
This is a project developed in Ruby on Rails 5 for ArchHacks 2016.

The concept of MedLog is for healthcare professionals to have easy access to patient records.

The records can be easily updated and maintained.  They are also easily exported for potential use
in in-house creations of hospital IT departments, or to transfer from one medical database to another.

###How to download/install
Make sure you have RVM, Ruby, and Ruby Gems installed.

Git clone the app, cd into the directory, then run `bundle`.

Next, set up the database: `bundle exec rake db:create`.
Migrate the database: `bundle exec rake db:migrate`.

Finally, to run over localhost, run `rails server`.


#### Programmed by X Coan
[Github](http://github.com/xcoan)
