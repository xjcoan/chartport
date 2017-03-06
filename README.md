#xcoan/ChartPortMD

ChartPort MD

### What is it?
In short, ChartPort MD exists as a cloud-based service for healthcare professionals to have easy access to patient records.

Planned features include the ability for records to easily be transferred between healthcare facilities, records being exported for internal user, and the ability to prescribe mediations to patients and send those prescriptions to a chosen pharmacy.

### Development
This project was originally created at [ArchHacks](http://archhacks.io/) in November 2016.
It is currently being further revised and edited for the [GE Health Cloud Innovation Challenge](http://gehealthcloud.devpost.com).

A page style guide (for front-end/view development) can be found [here](/app/views/readme.md).


### Features
* User Accounts - Support for both doctors and system administrators.
* Patient Records - Patients "belong" to a doctor in the system, but can be transferred easily to other doctors.  Only the current doctor may edit patient information.
* Patient Notes - Records entered by a doctor about the patient, appearing on the patient's record in ChartPort.
* Prescriptions and Medications - Doctors can add prescriptions to patient records.
* Hospitals - ChartPort includes support to show registered hospitals or other medical facilities.  Each page includes Google Maps Geolocation support.
* Hospital Registrations - Doctor accounts can "register" to any hospital they practice at.  Registrations can be viewed from the Doctor's page.  A list of registrations per hospital can be seen at the hospital's record page.
* Encryption - Data contained within ChartPort is encrypted.

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
