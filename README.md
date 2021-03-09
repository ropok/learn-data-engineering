# daily_hotel_booking_funnel Documentation

## 1. Import library
```python
import pandas as pd
```

## 2. load the dataset
```python
data = pd.read_csv('Pegipegi Case Study - Data Engineer Technical Test (Data Source).csv')
```

## 3. separate the columns
```python
event_date = [date.split(" ")[0] for date in data['event_time']]
interface_type = [interface.upper() for interface in data['interface_type']]
app_version = [app for app in data['app_version']]
event_name = [event for event in data['event_name']]
```

## 4. sorting the separated columns for looping purpose
```python
event_date_sort = sorted(set(event_date))
interface_type_sort = sorted(set(interface_type))
app_version_sort = sorted(set(app_version))
event_name_sort = sorted(set(event_name))
#changeorder
event_name_sort = ['Visit', 'Search', 'ViewProduct', 'AddToCart', 'Checkout', 'SelectPayment', 'CreateBooking',
             'visit', 'search', 'view_product', 'add_to_cart', 'checkout', 'select_payment', 'create_booking']
```

## 5. Loop for the daily_hotel_booking_funnel.csv
```python
print("event_date, interface_type, app_version, num_visit, num_search, num_product_viewed, num_add_to_cart, num_checkout, num_payment_selected, num_booking_created, num_session_visit, num_session_search, num_session_product_viewed, num_session_add_to_cart, num_session_checkout, num_session_payment_selected, num_session_booking_created")
event_count = []
event_count_text = ""
for date in event_date_sort:
    for interface in interface_type_sort:
        for version in app_version_sort:
            events = [rec for index, rec in enumerate(data['event_name'])
          if date in event_date[index]
          and interface in interface_type[index]
          and version in app_version[index]]
            for index, event in enumerate(event_name_sort):
                event_count.append(str(events.count(event)))
            event_count_text = ",".join(event_count)
            event_count = []
            print("{},{},{},{}".format(date, interface, version, event_count_text))
```


*P.S: really hard code, just run the `$ python daily_hotel_booking_funnel.py`, pardon me for copy-paste needed on the printed result. Kindly give me any advice to deeper learn this data engineering stuffs.*