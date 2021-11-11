# Emma-App
Being a heavy operation the suggestion is to optimize the API usage.

In this project with usage of sql we try to obtain insights for a user compared to other users.

Limitations:
Initially we will support insights for week, month, quarterly, half yearly and yearly.
If needed the solution can be extended to specific days as well.

Not considering the timezones in this solution. Assuming the whole deployment setup is different in every region.

Solution:
We will have a new table that stores the sum of amount each user spends at each merchant.
The table will be dd-mm-yyyy(id, user_id, merchantId, total_amount)

The table can be created in two ways:
Create asynchronously at 00:00:00 hrs, with this the table is readily availble and can be used accordingly.
or when a new event is received for the day. 

Example:
If a user spends 100euro at Pizzahut 3 times in a day. The transactions table will have 3 entries in the DB.
The daily table will have an entry with user_1, merchant_123, 300euro


We use a single queue here as we do not have to re-subscribe to following days events.
Every event will contain the date so that it can be routed to its corresponsing table, on failure of events 
these events will not be lost and can be re-queued to evaluation.

RabbitMQ/SNS/Pub-sub model:
Every transction is posted into an event queue.
The api that inserts into the transactions table will be producer and consumer will insert the data into the daily table.
On a race condition with table creation and event we retry failed events 2-3 times to overcome the scenario.

Weekly Insights will be shown to user on every Monday, monthly insights at the end of each month similarly for quartery, half yearly and annually. The data for weeks, months etc.. will be generated in cron jobs that run in the background. We can choose when to clean up the daily/weekly/monlty tables as the time passes by.

SQL does not have a limit of number of tables we can have in a DB. Levereging that, the insights will be always obtained with 
a few joins and aggregations. Consumes less memory and maintaining the speed of the API as well. None of thee API's are blocked and 
the insights can be obtained with minimal memory/resource usage.

Pagination should be used to restrict the number of merchants to be considered per request.

What to expect from the assignment:
The solution here implemented with event driven architecture as shown below. 
The data is preloaded into the daily tables for the current week i.e. from 7th to 11th of November.
The api will calculate insights from these tables.
The pub/sub model is implemented and a table will be created when first event is received for simplicity.
API to add a transction is provided.
# typescript-express-starter
