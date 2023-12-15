import ephem
from geopy.geocoders import Nominatim
from datetime import datetime
from pytz import timezone, all_timezones
from timezonefinder import TimezoneFinder
import os, math
import swisseph as swe
swe.set_ephe_path(os.getcwd() + 'swisseph/')

# DEPENDENCIES
# pip install geopy
# pip install pytz
# pip install timezonefinder
# pip install swisseph
# pip install ephem


# Both calculate_moon_sign and calculate_rising_sign take the parameters (date_of_birth, time_of_birth, place_of_birth)
# date_of_birth: format 'YYYY/MM/DD'
# time_of_birth: format 'HH:MM:SS'
# place_of_birth: City of birth


# Function for calculating moon sign
def calculate_moon_sign(date_of_birth, time_of_birth, place_of_birth):
    def get_city_coordinates(city_name):
        geolocator = Nominatim(user_agent="moon_sign_app")
        location = geolocator.geocode(city_name)

        if location:
            return location.latitude, location.longitude
        else:
            return None

    observer = ephem.Observer()
    observer.date = date_of_birth + ' ' + time_of_birth
    
    city_coordinates = get_city_coordinates(place_of_birth)
    
    if city_coordinates:
        observer.lon = str(city_coordinates[1])
        observer.lat = str(city_coordinates[0])
        
        # Calculate moon sign
        moon = ephem.Moon()
        moon.compute(observer)
        moon_sign = ephem.constellation(moon)[1]
        
        return moon_sign
    else:
        return "Coordinates not found for the provided place of birth"

# Example usage:
date_of_birth = '2002/05/21'
time_of_birth = '11:56:00'  # Replace with the actual time of birth
place_of_birth = 'Torrance'  # Replace with the actual place of birth
moon_sign = calculate_moon_sign(date_of_birth, time_of_birth, place_of_birth)
print(f"The moon sign for {date_of_birth} at {time_of_birth} in {place_of_birth} is {moon_sign}")


#####################################


# Function for calculating rising sign
def calculate_rising_sign(date_of_birth, time_of_birth, place_of_birth):
    geolocator = Nominatim(user_agent="rising_sign_app")
    location = geolocator.geocode(place_of_birth)

    if location:
        lat = math.radians(location.latitude)
        lon = math.radians(location.longitude)

        # Use timezonefinder to get the timezone from coordinates
        tf = TimezoneFinder()
        tz_name = tf.timezone_at(lat=location.latitude, lng=location.longitude)

        # Check if timezone is found
        if tz_name:
            tz = timezone(tz_name)
            timecheck = tz.localize(datetime.strptime(date_of_birth + ' ' + time_of_birth, '%Y/%m/%d %H:%M:%S'))

            swe.set_sid_mode(swe.SIDM_LAHIRI)

            jd = float(swe.utc_to_jd(timecheck.year, timecheck.month, timecheck.day,
                                     timecheck.hour, timecheck.minute, 0.1, 1)[1])

            W = bytes('W', encoding='utf8')
            ascDeg = float(swe.houses_ex(jd, lat, lon, W)[0][1])
            asc = int(ascDeg / 30)

            if asc >= 6:
                ascDeg = float(swe.houses_ex(jd, lat, lon, W, swe.FLG_SIDEREAL)[0][1]) - swe.get_ayanamsa_ut(jd)
                asc = int(ascDeg / 30)

            if asc == 0:
                asc = 12

            # Mapping Ascendant numbers to Zodiac signs
            zodiac_signs = {
                1: 'Aries', 2: 'Taurus', 3: 'Gemini', 4: 'Cancer',
                5: 'Leo', 6: 'Virgo', 7: 'Libra', 8: 'Scorpio',
                9: 'Sagittarius', 10: 'Capricorn', 11: 'Aquarius', 12: 'Pisces'
            }

            return zodiac_signs.get(asc, "Unknown")
        else:
            return "Timezone not found for the provided coordinates."
    else:
        return "Coordinates not found for the provided place of birth."


# # Example usage:
date_of_birth = '2002/05/21'
time_of_birth = '11:56:00'
place_of_birth = 'Torrance'
rising_sign = calculate_rising_sign(date_of_birth, time_of_birth, place_of_birth)
print(f"The rising sign for {date_of_birth} at {time_of_birth} in {place_of_birth} is {rising_sign}")