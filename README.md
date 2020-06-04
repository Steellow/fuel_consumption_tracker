# fuel_consumption_tracker

Simple app to track average fuel consumption. Free, minimal, and open source. No bullshit features.

## Ideas

- autohide keyboard on main screen
- auto odometer to fuel_fueld
- titlebar bottom shadow
- https://pub.dev/packages/rate_my_app
- finnish translation
- test if mpg actually works
- dateformfield tect edit cursor on top of date pick field?
- prettify code
- indicator that you can edit logs
- overflow when entering edit log
- change submit button text when editing log
- setstate when updating log

### TEST

- test what whappens if you don't log in order
- date format picker on smaller screens


### HIFI

- indigo to indigogradient?
- history screen transition


## stuff

prefs hive box
    'minOdo', 'maxOdo' are smallest and biggest odos recorded
    'imperialEnabled' is in prefs instead of settings, because it's more relevant there


## things I've learned

- Using valuableListenableBuilder for everything is a mess (if the app grows), easier to just implement proper state management
- Hive is way easier and better than shared_preferences
- Always make helper class for shared_prefs etc. which automatically returns default values
- abstract class = can't make instance of that class
    - static method = called directly from class, not instace