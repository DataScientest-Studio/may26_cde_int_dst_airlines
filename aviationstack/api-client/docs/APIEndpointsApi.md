# swagger_client.APIEndpointsApi

All URIs are relative to *https://api.aviationstack.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_aircraft_types**](APIEndpointsApi.md#get_aircraft_types) | **GET** /v1/aircraft_types | Aircraft Types
[**get_airlines**](APIEndpointsApi.md#get_airlines) | **GET** /v1/airlines | Airlines.
[**get_airplanes**](APIEndpointsApi.md#get_airplanes) | **GET** /v1/airplanes | AirPlanes.
[**get_airports**](APIEndpointsApi.md#get_airports) | **GET** /v1/airports | Airports.
[**get_cities**](APIEndpointsApi.md#get_cities) | **GET** /v1/cities | Cities
[**get_countries**](APIEndpointsApi.md#get_countries) | **GET** /v1/countries | Countries
[**get_flight_schedule**](APIEndpointsApi.md#get_flight_schedule) | **GET** /v1/timetable | Flight Schedules (Timetable).
[**get_flights**](APIEndpointsApi.md#get_flights) | **GET** /v1/flights | Real-Time Flights and Historical Flights.
[**get_future_flights**](APIEndpointsApi.md#get_future_flights) | **GET** /v1/flightsFuture | Future Flight Schedules.
[**get_routes**](APIEndpointsApi.md#get_routes) | **GET** /v1/routes | Airline Routes.
[**get_taxes**](APIEndpointsApi.md#get_taxes) | **GET** /v1/taxes | Aviation Taxes

# **get_aircraft_types**
> AirCraftTypes get_aircraft_types(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)

Aircraft Types

To get data about different aircraft types, you can use the API's aircraft_types endpoint. Customers subscribed to the Basic Plan or higher may also make use of the search request parameter to get aircraft type autocomplete suggestions.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
search = 'search_example' # str | Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. (optional)

try:
    # Aircraft Types
    api_response = api_instance.get_aircraft_types(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_aircraft_types: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **search** | **str**| Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. | [optional] 

### Return type

[**AirCraftTypes**](AirCraftTypes.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_airlines**
> AirLines get_airlines(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)

Airlines.

To get data about global airlines, you can use the API's airlines endpoint. Customers subscribed to the Basic Plan or higher may also make use of the search request parameter to get airline autocomplete suggestions.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
search = 'search_example' # str | Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. (optional)

try:
    # Airlines.
    api_response = api_instance.get_airlines(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_airlines: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **search** | **str**| Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. | [optional] 

### Return type

[**AirLines**](AirLines.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_airplanes**
> AirPlanes get_airplanes(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)

AirPlanes.

To get data about different airplanes/aircrafts, you can use the API's airplanes endpoint. Customers subscribed to the Basic Plan or higher may also make use of the search request parameter to get airplane autocomplete suggestions.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
search = 'search_example' # str | Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. (optional)

try:
    # AirPlanes.
    api_response = api_instance.get_airplanes(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_airplanes: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **search** | **str**| Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. | [optional] 

### Return type

[**AirPlanes**](AirPlanes.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_airports**
> Airports get_airports(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)

Airports.

To get data about global airports, you can use the API's airports endpoint. Customers subscribed to the Basic Plan or higher may also make use of the search request parameter to get airport autocomplete suggestions.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
search = 'search_example' # str | Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. (optional)

try:
    # Airports.
    api_response = api_instance.get_airports(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_airports: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **search** | **str**| Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. | [optional] 

### Return type

[**Airports**](Airports.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_cities**
> Cities get_cities(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)

Cities

To look up destination cities, you can use the API's cities endpoint. Customers subscribed to the Basic Plan or higher may also make use of the search request parameter to get city autocomplete suggestions.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
search = 'search_example' # str | Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. (optional)

try:
    # Cities
    api_response = api_instance.get_cities(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_cities: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **search** | **str**| Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. | [optional] 

### Return type

[**Cities**](Cities.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_countries**
> Countries get_countries(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)

Countries

To look up destination countries, you can use the API's countries endpoint. Customers subscribed to the Basic Plan or higher may also make use of the search request parameter to get country autocomplete suggestions.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
search = 'search_example' # str | Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. (optional)

try:
    # Countries
    api_response = api_instance.get_countries(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_countries: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **search** | **str**| Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. | [optional] 

### Return type

[**Countries**](Countries.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_flight_schedule**
> Timetable get_flight_schedule(access_key, iata_code, type, limit=limit, offset=offset, status=status, airline_name=airline_name, airline_iata=airline_iata, airline_icao=airline_icao, flight_iata=flight_iata, flight_icao=flight_icao, flight_num=flight_num, dep_terminal=dep_terminal, dep_delay=dep_delay, dep_sch_time=dep_sch_time, dep_est_time=dep_est_time, dep_act_time=dep_act_time, dep_est_runway=dep_est_runway, dep_act_runway=dep_act_runway, arr_terminal=arr_terminal, arr_delay=arr_delay, arr_sch_time=arr_sch_time, arr_est_time=arr_est_time, arr_act_time=arr_act_time, arr_est_runway=arr_est_runway, arr_act_runway=arr_act_runway, param_callback=param_callback)

Flight Schedules (Timetable).

The API's timetable endpoint returns real-time flight schedules (departures and arrivals) for a given airport. Specify the airport IATA code and the schedule type (departure or arrival) you are interested in.      *      * **Note:** The `/timetable` and `/flightsFuture` endpoints have rate limits of 1 request every 10 seconds for Paid Plans and 1 request every 60 seconds for Free Plans, and exceeding these limits may result in throttling.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
iata_code = 'iata_code_example' # str | IATA code of the airport for which the flight schedule should be retrieved. Example: JFK
type = 'type_example' # str | The type of schedule to retrieve. Available values: departure, arrival
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
status = 'status_example' # str | Filter your results by flight status. Available values: landed, scheduled, cancelled, active, incident, diverted, redirected, unknown (optional)
airline_name = 'airline_name_example' # str | Filter your results by airline name. (optional)
airline_iata = 'airline_iata_example' # str | Filter your results by airline IATA code. (optional)
airline_icao = 'airline_icao_example' # str | Filter your results by airline ICAO code. (optional)
flight_iata = 'flight_iata_example' # str | Filter your results by flight IATA code. (optional)
flight_icao = 'flight_icao_example' # str | Filter your results by flight ICAO code. (optional)
flight_num = 'flight_num_example' # str | Filter your results by flight number. (optional)
dep_terminal = 'dep_terminal_example' # str | Filter your results by departure terminal. (optional)
dep_delay = 56 # int | Filter your results by departure delay (minutes). (optional)
dep_sch_time = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by departure scheduled time. (optional)
dep_est_time = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by departure estimated time. (optional)
dep_act_time = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by departure actual time. (optional)
dep_est_runway = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by departure estimated runway time. (optional)
dep_act_runway = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by departure actual runway time. (optional)
arr_terminal = 'arr_terminal_example' # str | Filter your results by arrival terminal. (optional)
arr_delay = 56 # int | Filter your results by arrival delay (minutes). (optional)
arr_sch_time = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by arrival scheduled time. (optional)
arr_est_time = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by arrival estimated time. (optional)
arr_act_time = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by arrival actual time. (optional)
arr_est_runway = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by arrival estimated runway time. (optional)
arr_act_runway = '2013-10-20T19:20:30+01:00' # datetime | Filter your results by arrival actual runway time. (optional)
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)

try:
    # Flight Schedules (Timetable).
    api_response = api_instance.get_flight_schedule(access_key, iata_code, type, limit=limit, offset=offset, status=status, airline_name=airline_name, airline_iata=airline_iata, airline_icao=airline_icao, flight_iata=flight_iata, flight_icao=flight_icao, flight_num=flight_num, dep_terminal=dep_terminal, dep_delay=dep_delay, dep_sch_time=dep_sch_time, dep_est_time=dep_est_time, dep_act_time=dep_act_time, dep_est_runway=dep_est_runway, dep_act_runway=dep_act_runway, arr_terminal=arr_terminal, arr_delay=arr_delay, arr_sch_time=arr_sch_time, arr_est_time=arr_est_time, arr_act_time=arr_act_time, arr_est_runway=arr_est_runway, arr_act_runway=arr_act_runway, param_callback=param_callback)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_flight_schedule: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **iata_code** | **str**| IATA code of the airport for which the flight schedule should be retrieved. Example: JFK | 
 **type** | **str**| The type of schedule to retrieve. Available values: departure, arrival | 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **status** | **str**| Filter your results by flight status. Available values: landed, scheduled, cancelled, active, incident, diverted, redirected, unknown | [optional] 
 **airline_name** | **str**| Filter your results by airline name. | [optional] 
 **airline_iata** | **str**| Filter your results by airline IATA code. | [optional] 
 **airline_icao** | **str**| Filter your results by airline ICAO code. | [optional] 
 **flight_iata** | **str**| Filter your results by flight IATA code. | [optional] 
 **flight_icao** | **str**| Filter your results by flight ICAO code. | [optional] 
 **flight_num** | **str**| Filter your results by flight number. | [optional] 
 **dep_terminal** | **str**| Filter your results by departure terminal. | [optional] 
 **dep_delay** | **int**| Filter your results by departure delay (minutes). | [optional] 
 **dep_sch_time** | **datetime**| Filter your results by departure scheduled time. | [optional] 
 **dep_est_time** | **datetime**| Filter your results by departure estimated time. | [optional] 
 **dep_act_time** | **datetime**| Filter your results by departure actual time. | [optional] 
 **dep_est_runway** | **datetime**| Filter your results by departure estimated runway time. | [optional] 
 **dep_act_runway** | **datetime**| Filter your results by departure actual runway time. | [optional] 
 **arr_terminal** | **str**| Filter your results by arrival terminal. | [optional] 
 **arr_delay** | **int**| Filter your results by arrival delay (minutes). | [optional] 
 **arr_sch_time** | **datetime**| Filter your results by arrival scheduled time. | [optional] 
 **arr_est_time** | **datetime**| Filter your results by arrival estimated time. | [optional] 
 **arr_act_time** | **datetime**| Filter your results by arrival actual time. | [optional] 
 **arr_est_runway** | **datetime**| Filter your results by arrival estimated runway time. | [optional] 
 **arr_act_runway** | **datetime**| Filter your results by arrival actual runway time. | [optional] 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 

### Return type

[**Timetable**](Timetable.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_flights**
> Flights get_flights(access_key, param_callback=param_callback, limit=limit, offset=offset, flight_status=flight_status, flight_date=flight_date, dep_iata=dep_iata, arr_iata=arr_iata, dep_icao=dep_icao, arr_icao=arr_icao, airline_name=airline_name, airline_iata=airline_iata, airline_icao=airline_icao, flight_number=flight_number, flight_iata=flight_iata, flight_icao=flight_icao, min_delay_dep=min_delay_dep, min_delay_arr=min_delay_arr, max_delay_dep=max_delay_dep, max_delay_arr=max_delay_arr, arr_scheduled_time_arr=arr_scheduled_time_arr, dep_scheduled_time_dep=dep_scheduled_time_dep)

Real-Time Flights and Historical Flights.

# Real-Time Flights      * The API is capable of tracking flights and retrieving flight status information in real-time. In order to look up real-time information about one or multiple flights, you can use the API's flights endpoint together with optional parameters to filter your result set.      * # Historical Flights      * Apart from providing data about real-time flight, the API's flights endpoint is also capable of looking up data about historical flights. In order to request data about one or more past flights, simply attach the flight_date parameter to your API request URL and set it to a date of your choice.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
flight_status = 'flight_status_example' # str | Filter your results by flight status. Available values: scheduled, active, landed, cancelled, incident, diverted (optional)
flight_date = '2013-10-20' # date | Filter your results by providing a flight date in the format YYYY-MM-DD. Example: 2019-02-31      *      * **Note:** Aviationstack provides historical data for the last 12 months only.      *      * **Note:** The API response returned for historical flights is identical to the API response returned for real-time flight data. To see the API response, please jump to the Real-Time Flights section. (optional)
dep_iata = 'dep_iata_example' # str | Filter your results by departure city or airport using an IATA code. You can retrieve IATA codes using the Airports or Cities API endpoints. (optional)
arr_iata = 'arr_iata_example' # str | Filter your results by arrival city or airport using an IATA code. You can retrieve IATA codes using the Airports or Cities API endpoints. (optional)
dep_icao = 'dep_icao_example' # str | Filter your results by departure airport using an ICAO code. You can retrieve ICAO codes using the Airports API endpoint. (optional)
arr_icao = 'arr_icao_example' # str | Filter your results by arrival airport using an ICAO code. You can retrieve ICAO codes using the Airports API endpoint. (optional)
airline_name = 'airline_name_example' # str | Filter your results by airline name. You can retrieve airline names using the Airlines API endpoint. (optional)
airline_iata = 'airline_iata_example' # str | Filter your results by airline IATA code. You can retrieve airline IATA codes using the Airlines API endpoint. (optional)
airline_icao = 'airline_icao_example' # str | Filter your results by airline ICAO code. You can retrieve airline ICAO codes using the Airlines API endpoint. (optional)
flight_number = 'flight_number_example' # str | Filter your results by providing a flight number. Example: 2557. (optional)
flight_iata = 'flight_iata_example' # str | Filter your results by providing a flight IATA code. Example: MU2557. (optional)
flight_icao = 'flight_icao_example' # str | Filter your results by providing a flight ICAO code. Example: CES2557. (optional)
min_delay_dep = 56 # int | Filter your results by providing a minimum amount of minutes in departure delay. Example: 7 for seven minutes of delay in departure. (optional)
min_delay_arr = 56 # int | Filter your results by providing a minimum amount of minutes in arrival delay. Example: 7 for seven minutes of delay in arrival. (optional)
max_delay_dep = 56 # int | Filter your results by providing a maximum amount of minutes in departure delay. Example: 60 for one hour of delay in departure. (optional)
max_delay_arr = 56 # int | Filter your results by providing a maximum amount of minutes in arrival delay. Example: 60 for one hour of delay in arrival. (optional)
arr_scheduled_time_arr = '2013-10-20' # date | Filter your results by arrival scheduled date. [Format: YYYY-MM-DD] (optional)
dep_scheduled_time_dep = '2013-10-20' # date | Filter your results by departure scheduled date. [Format: YYYY-MM-DD] (optional)

try:
    # Real-Time Flights and Historical Flights.
    api_response = api_instance.get_flights(access_key, param_callback=param_callback, limit=limit, offset=offset, flight_status=flight_status, flight_date=flight_date, dep_iata=dep_iata, arr_iata=arr_iata, dep_icao=dep_icao, arr_icao=arr_icao, airline_name=airline_name, airline_iata=airline_iata, airline_icao=airline_icao, flight_number=flight_number, flight_iata=flight_iata, flight_icao=flight_icao, min_delay_dep=min_delay_dep, min_delay_arr=min_delay_arr, max_delay_dep=max_delay_dep, max_delay_arr=max_delay_arr, arr_scheduled_time_arr=arr_scheduled_time_arr, dep_scheduled_time_dep=dep_scheduled_time_dep)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_flights: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **flight_status** | **str**| Filter your results by flight status. Available values: scheduled, active, landed, cancelled, incident, diverted | [optional] 
 **flight_date** | **date**| Filter your results by providing a flight date in the format YYYY-MM-DD. Example: 2019-02-31      *      * **Note:** Aviationstack provides historical data for the last 12 months only.      *      * **Note:** The API response returned for historical flights is identical to the API response returned for real-time flight data. To see the API response, please jump to the Real-Time Flights section. | [optional] 
 **dep_iata** | **str**| Filter your results by departure city or airport using an IATA code. You can retrieve IATA codes using the Airports or Cities API endpoints. | [optional] 
 **arr_iata** | **str**| Filter your results by arrival city or airport using an IATA code. You can retrieve IATA codes using the Airports or Cities API endpoints. | [optional] 
 **dep_icao** | **str**| Filter your results by departure airport using an ICAO code. You can retrieve ICAO codes using the Airports API endpoint. | [optional] 
 **arr_icao** | **str**| Filter your results by arrival airport using an ICAO code. You can retrieve ICAO codes using the Airports API endpoint. | [optional] 
 **airline_name** | **str**| Filter your results by airline name. You can retrieve airline names using the Airlines API endpoint. | [optional] 
 **airline_iata** | **str**| Filter your results by airline IATA code. You can retrieve airline IATA codes using the Airlines API endpoint. | [optional] 
 **airline_icao** | **str**| Filter your results by airline ICAO code. You can retrieve airline ICAO codes using the Airlines API endpoint. | [optional] 
 **flight_number** | **str**| Filter your results by providing a flight number. Example: 2557. | [optional] 
 **flight_iata** | **str**| Filter your results by providing a flight IATA code. Example: MU2557. | [optional] 
 **flight_icao** | **str**| Filter your results by providing a flight ICAO code. Example: CES2557. | [optional] 
 **min_delay_dep** | **int**| Filter your results by providing a minimum amount of minutes in departure delay. Example: 7 for seven minutes of delay in departure. | [optional] 
 **min_delay_arr** | **int**| Filter your results by providing a minimum amount of minutes in arrival delay. Example: 7 for seven minutes of delay in arrival. | [optional] 
 **max_delay_dep** | **int**| Filter your results by providing a maximum amount of minutes in departure delay. Example: 60 for one hour of delay in departure. | [optional] 
 **max_delay_arr** | **int**| Filter your results by providing a maximum amount of minutes in arrival delay. Example: 60 for one hour of delay in arrival. | [optional] 
 **arr_scheduled_time_arr** | **date**| Filter your results by arrival scheduled date. [Format: YYYY-MM-DD] | [optional] 
 **dep_scheduled_time_dep** | **date**| Filter your results by departure scheduled date. [Format: YYYY-MM-DD] | [optional] 

### Return type

[**Flights**](Flights.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_future_flights**
> FlightsFuture get_future_flights(access_key, iata_code, type, _date, airline_iata=airline_iata, airline_icao=airline_icao, flight_number=flight_number, limit=limit, offset=offset, param_callback=param_callback)

Future Flight Schedules.

The API's flightsFuture endpoint returns flight schedules for a future date. Specify the airport IATA code, the schedule type (departure or arrival) and the date you are interested in.      *      * **Note:** Flight blocks within a codeshared block take precedence over those outside it for filtering purposes. So, if there is a flight block inside codeshared, then it will search the query param to match in this `codeshared>flight>iataNumber`. If codeshared block is not present then it will refer to the `flight>iataNumber`.      *      * **Note:** The `/timetable` and `/flightsFuture` endpoints have rate limits of 1 request every 10 seconds for Paid Plans and 1 request every 60 seconds for Free Plans, and exceeding these limits may result in throttling. Also, we do not include very low-traffic airports (like CDT, which has around 10 or fewer flights per day) in our feeds.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
iata_code = 'iata_code_example' # str | IATA code of the airport for which the future flight schedule should be retrieved. Example: JFK
type = 'type_example' # str | The type of schedule to retrieve. Available values: departure, arrival
_date = '2013-10-20' # date | The future date for which the flight schedule should be retrieved, in the format YYYY-MM-DD.
airline_iata = 'airline_iata_example' # str | Filter your results by airline IATA code. (optional)
airline_icao = 'airline_icao_example' # str | Filter your results by airline ICAO code. (optional)
flight_number = 'flight_number_example' # str | Filter your results by flight number. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)

try:
    # Future Flight Schedules.
    api_response = api_instance.get_future_flights(access_key, iata_code, type, _date, airline_iata=airline_iata, airline_icao=airline_icao, flight_number=flight_number, limit=limit, offset=offset, param_callback=param_callback)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_future_flights: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **iata_code** | **str**| IATA code of the airport for which the future flight schedule should be retrieved. Example: JFK | 
 **type** | **str**| The type of schedule to retrieve. Available values: departure, arrival | 
 **_date** | **date**| The future date for which the flight schedule should be retrieved, in the format YYYY-MM-DD. | 
 **airline_iata** | **str**| Filter your results by airline IATA code. | [optional] 
 **airline_icao** | **str**| Filter your results by airline ICAO code. | [optional] 
 **flight_number** | **str**| Filter your results by flight number. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 

### Return type

[**FlightsFuture**](FlightsFuture.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_routes**
> Routes get_routes(access_key, param_callback=param_callback, limit=limit, offset=offset, flight_number=flight_number, dep_iata=dep_iata, arr_iata=arr_iata, dep_icao=dep_icao, arr_icao=arr_icao, airline_iata=airline_iata, airline_icao=airline_icao)

Airline Routes.

The aviationstack API is capable of providing data about airline routes, updated every 24 hours. In order to get airline route data, use the API's routes endpoint along with a series of optional parameters to filter results.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
flight_number = 'flight_number_example' # str | Filter your results by providing a flight number. Example: 2557 (optional)
dep_iata = 'dep_iata_example' # str | Filter your results by departure city or airport using an IATA code. You can retrieve IATA codes using the Airports or Cities API endpoints. (optional)
arr_iata = 'arr_iata_example' # str | Filter your results by arrival city or airport using an IATA code. You can retrieve IATA codes using the Airports or Cities API endpoints. (optional)
dep_icao = 'dep_icao_example' # str | Filter your results by departure airport using an ICAO code. You can retrieve ICAO codes using the Airports API endpoint. (optional)
arr_icao = 'arr_icao_example' # str | Filter your results by arrival airport using an ICAO code. You can retrieve ICAO codes using the Airports API endpoint. (optional)
airline_iata = 'airline_iata_example' # str | Filter your results by airline IATA code. You can retrieve airline IATA codes using the Airlines API endpoint. (optional)
airline_icao = 'airline_icao_example' # str | Filter your results by airline ICAO code. You can retrieve airline ICAO codes using the Airlines API endpoint. (optional)

try:
    # Airline Routes.
    api_response = api_instance.get_routes(access_key, param_callback=param_callback, limit=limit, offset=offset, flight_number=flight_number, dep_iata=dep_iata, arr_iata=arr_iata, dep_icao=dep_icao, arr_icao=arr_icao, airline_iata=airline_iata, airline_icao=airline_icao)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_routes: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **flight_number** | **str**| Filter your results by providing a flight number. Example: 2557 | [optional] 
 **dep_iata** | **str**| Filter your results by departure city or airport using an IATA code. You can retrieve IATA codes using the Airports or Cities API endpoints. | [optional] 
 **arr_iata** | **str**| Filter your results by arrival city or airport using an IATA code. You can retrieve IATA codes using the Airports or Cities API endpoints. | [optional] 
 **dep_icao** | **str**| Filter your results by departure airport using an ICAO code. You can retrieve ICAO codes using the Airports API endpoint. | [optional] 
 **arr_icao** | **str**| Filter your results by arrival airport using an ICAO code. You can retrieve ICAO codes using the Airports API endpoint. | [optional] 
 **airline_iata** | **str**| Filter your results by airline IATA code. You can retrieve airline IATA codes using the Airlines API endpoint. | [optional] 
 **airline_icao** | **str**| Filter your results by airline ICAO code. You can retrieve airline ICAO codes using the Airlines API endpoint. | [optional] 

### Return type

[**Routes**](Routes.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_taxes**
> Taxes get_taxes(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)

Aviation Taxes

To get data about aviation taxes, you can use the API's taxes endpoint. Customers subscribed to the Basic Plan or higher may also make use of the search request parameter to get autocomplete suggestions.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['access_key'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))
access_key = 'access_key_example' # str | Your API access key, which can be found in your account dashboard.
param_callback = 'param_callback_example' # str | Use this parameter to specify a JSONP callback function name to wrap your API response in. (optional)
limit = 100 # int | Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. (optional) (default to 100)
offset = 0 # int | Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. (optional) (default to 0)
search = 'search_example' # str | Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. (optional)

try:
    # Aviation Taxes
    api_response = api_instance.get_taxes(access_key, param_callback=param_callback, limit=limit, offset=offset, search=search)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling APIEndpointsApi->get_taxes: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_key** | **str**| Your API access key, which can be found in your account dashboard. | 
 **param_callback** | **str**| Use this parameter to specify a JSONP callback function name to wrap your API response in. | [optional] 
 **limit** | **int**| Specify a limit of results to return in your API response. Maximum allowed value is 100 below Professional Plan and 1000 on and above Professional Plan. Default value is 100. | [optional] [default to 100]
 **offset** | **int**| Specify an offset for pagination. Example: Specifying an offset of 10 in combination with a limit of 10 will show results 10-20. Default offset value is 0, starting with the first available result. | [optional] [default to 0]
 **search** | **str**| Use this parameter to get autocomplete suggestions by specifying any search term as a string. This feature is only available on the Basic Plan and higher. | [optional] 

### Return type

[**Taxes**](Taxes.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

