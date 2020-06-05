# fuel_consumption_tracker

Simple app to track average fuel consumption. Free, minimal, and open source. No bullshit features. Releasing on gPlay soon.

| Main screen                       | New log/edit log                 | View logs                             | Settings                                  |
|-----------------------------------|----------------------------------|---------------------------------------|-------------------------------------------|
| ![Main screen](/scrnsht/main.png) | ![New log](/scrnsht/new_log.png) | ![History view](/scrnsht/history.png) | ![Settings screen](/scrnsht/settings.png) |

## Ideas (a.k.a. todo)

- https://pub.dev/packages/rate_my_app (after app is in gPlay)
- finnish translation
- prettify code


### TEST

- test what whappens if you don't log in order
- date format picker on smaller screens
- test on smaller screens


### BUGS

- unit_tile doesn't rebuild when resetting everything


### HIFI

- indigo to indigogradient?
- history screen transition
- titlebar bottom shadow
- change submit button text when editing log
- calendar view when tank'd


## stuff

prefs hive box
    'minOdo', 'maxOdo' are smallest and biggest odos recorded
    'imperialEnabled' is in prefs instead of settings, because it's more relevant there


### things I've learned

- Using valuableListenableBuilder for everything is a mess (if the app grows), easier to just implement proper state management
- Hive is way easier and better than shared_preferences
- Always make helper class for shared_prefs etc. which automatically returns default values
- abstract class = can't make instance of that class
    - static method = called directly from class, not instace
- making quick n' dirty (fronted) prototype of the app really helps get the ball rolling