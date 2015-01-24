
# Load File

- source enviornment
    cd '~/code/dotfiles/python/'
    %run -i visualization.py

- load data
    cd '~/GoogleDrive/CodeData/'
    b = read_csv('OrderShipTimes.csv')  

- explore data
    list(b)
    b.dtypes

- rename columns
    b.rename(columns=
         {'ohdr_number': 'OrderNumber', 
         'ohdr_ordcus': 'Customer', 
         'shph_date': 'ShipDate', 
         'osch_date': 'ScheduledDate', 
          'ohdr_datord': 'OrderDate'}, 
         inplace=True)

- select /drop columns
    b = b[['OrderNumber',
       'Customer',
       'ShipDate',
       'ScheduledDate',
       'OrderDate']]

- import date
    b['ScheduledDate']  =  to_datetime(Series(b.ScheduledDate))
    

