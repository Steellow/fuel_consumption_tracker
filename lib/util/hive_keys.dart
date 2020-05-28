const String PREFS_BOX = 'prefs'; // prefs box is quick access to important data, such as total consumption. Misleading name but no point in changing anymore
const String LOGS_BOX = 'logs';
const String SETTINGS_BOX = 'settingsbox';

const String TOTAL_FUEL = 'totalFuel'; // totalFuel DOES NOT include lastFuel
const String LAST_FUEL = 'lastFuel';
const String MIN_ODO = 'minOdo';
const String MAX_ODO = 'maxOdo';
const String IMPERIAL_ENABLED = 'imperialEnabled'; // This setting is in prefs because every time this setting is changed, prefs also have to be reloaded which ain't convenient (shitty workaround ik)

const String DARK_ENABLED = 'darkEnabled';
const String DATE_FORMAT = 'dateFormat';
