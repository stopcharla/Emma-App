# Emma-App
Being a heavy operation the suggestion is to optimize the API usage.

In this project with usage of sql we try to obtain insights for a user compared to other users.

Limitations:
Not considering the timezones in this solution. Assuming the whole deployment setup is different in every region.
Not allowing the hourly insights for user. Only considering the full day.

Solution:
Proposing a solution using sql window functions with over and partition by to obtain the required insights. With these we have prevented using unwanted multiple evaluations.

With this query the data is segmented into partitions per merchant and the percentile is calculated reducing the hassle of counting.

Indexes: we index transaction table with user_id, merchant_id and date to speed up the query operations, though it takes up decent amount of space. Storage is anyway a lot cheaper these days.

Advised to run batch jobs to pre-compute weekly, monthly etc. insights for user.

This API does not return the merchant details apart from id, the apps can query for the data using its own individual API.

Alternative Solution:
Creation of daily transaction tables that store sum of amount transacted by user at a merchant. But this will need multiple joins during the computation of user insights.

How to run:
This project is dockerized, leaving out the whole pain process.


clone this repo.
To the terminal:
cd Emma-App
docker-compose up

to the browser:
open http://localhost:3000/api-docs/# 
you can execute the API here, very little amount of data is preloaded into the db.
Available userIids: 1,2,3,4
available merchant_ids: 1,2
transactions are inserted for 2021-11-07 to 2021-11-08

The API returns percentile in decimals which can be used as per the need of the API requester.