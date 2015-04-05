
# Grok pandas

You can think of a DataFrame as a group of Series that share
an index (in this case the column headers). This makes it
easy to select specific columns.

# pandas cheat sheet

https://drive.google.com/folderview?id=0ByIrJAE4KMTtaGhRcXkxNHhmY2M

# Load File

- source enviornment
    cd '~/code/dotfiles/python/'
    %run -i visualization.py

- load data
    cd '~/GoogleDrive/CodeData/'
    b = read_csv('OrderShipTimes.csv')  

# datetime

- import date
    b['ScheduledDate']  =  to_datetime(Series(b.ScheduledDate))

- http://stackoverflow.com/questions/18215317/extracting-days-from-a-numpy-timedelta64-value
- when days is stored as numpy mili seconds
    b['NumDaysLate'] = b.HowLate.astype('timedelta64[D]')

# explore data

    list(b)
    b.dtypes

# Manipulate columns

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

# Groupby    

http://stackoverflow.com/questions/15589354/frequency-tables-in-pandas-like-plyr-in-r

- function calls x, and not the original data
- read more about functional / object oriented programing

def BeteGroup(x):
    return Series({'SumOrderToShip' : sum(x['OrderedToShip']),
       'SumScheduleToShip' : sum(x['ScheduledToShip']),
       'SumNumTimesLate'   : sum(x['IsLate']),
       'TotalPurchases'    : len(x['OrderNumber'])})
bl = b.groupby('Customer').apply(BeteGroup)


