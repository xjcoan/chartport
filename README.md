<h1 align="center">ChartPort</h1>
<p align="center"><b>A cloud-based medical record management system built for healthcare professionals </b></p>
<hr>
<p align="center"> <img src="https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/000/483/355/datas/gallery.jpg" /> </p>

### Development History
This project was originally created at [ArchHacks](http://archhacks.io/) in November 2016.
It is currently being further revised and edited for the [GE Health Cloud Innovation Challenge](http://gehealthcloud.devpost.com).

ChartPort is no longer in active development.

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
You will also need postgres installed.

Git clone the app, cd into the directory, then run `bundle`.

Next, set up the database: `bundle exec rake db:create`.
Migrate the database: `bundle exec rake db:migrate`.

Finally, to run over localhost, run `rails server`.
Navigate to `localhost:3000` to see the app in your browser.

### Contributing
Create a new branch with your features/updates and create a pull request on Github.

A page style guide (for front-end/view development) can be found [here](/app/views/readme.md).

### Deployment information
ChartPort's production environment was previously deployed to AWS with an RDS mysql database.
It is currently hosted on Heroku for demo purposes.

### Browser Support
ChartPort should be _should_ be able to run on all browsers from IE9 and higher.

#### Future Development
There are currently no plans to develop ChartPort any further beyond upgrading dependencies for "fun".

#### Developers
X Coan [[Github](http://github.com/xcoan)]
