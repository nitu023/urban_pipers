This project was bootstrapped with (Create React App) and material UI

## install Requiremnet.txt
Create Vitual enviroment
### `sudo apt-get install python-pip python3-pip`
### `pip install virtualenv`
cd UrbanPiper
### `virtualenv env`
### `source env/bin/activate`
Using Below Command
###  `pip3 install -r requirements.txt`

### Database file
Database file is given as 

### `dec_1_urban.sql`
Import db file in postgress. 
Using below command,
###`psql urban < dec_1_urban.sql`

## For Backedend (In the urban_pipers/urban_backend folder)
### `python manage.py runserver`
Runs the app in the development mode.<br />
Open [http://localhost:8000](http://localhost:3000) to view it in the browser.

## For Frontend (In the urban_frontend folder)
### `npm install`
### `npm start`
Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.
In the project directory (urban_frontend) you can run:


The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### For Application
In The dash board you will see list of categories and in the sidebar and the items in the right side<br />
You can Click on Category(Pizza) in order to see the Items and you can filter it by veg,and sort it by price, and search it by items name.

