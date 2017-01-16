#xcoan/medlog

"MedLog Service" (WIP name)

### What is it?
In short, MedLog exists as a cloud-based service for healthcare professionals to have easy access to patient records.

Planned features include the ability for records to easily be transferred between healthcare facilities, records being exported for internal user, and the ability to prescribe mediations to patients and send those prescriptions to a chosen pharmacy.

### Development
This project was originally created at [ArchHacks](http://archhacks.io/) in November 2016.
It is currently being further revised and edited for the [GE Health Cloud Innovation Challenge](http://gehealthcloud.devpost.com).

### How to download/install for development
Make sure you have RVM, Ruby, and Ruby Gems installed.

Git clone the app, cd into the directory, then run `bundle`.

Next, set up the database: `bundle exec rake db:create`.
Migrate the database: `bundle exec rake db:migrate`.

Finally, to run over localhost, run `rails server`.


#### Is there a license?
Not yet. A license will be added upon completion/project submission to the Health Cloud Challenge (see above).


#### Developers
X Coan [[Github](http://github.com/xcoan)]
