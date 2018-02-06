#define COMPONENT advanced_ballistics
#define COMPONENT_BEAUTIFIED Advanced Ballistics
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#define DEBUG_INIT_SPEEDS

#ifdef DEBUG_ENABLED_ADVANCEDBALLISTICS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ADVANCEDBALLISTICS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ADVANCEDBALLISTICS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define ABSOLUTE_ZERO_IN_CELSIUS -273.15
#define KELVIN(t) (t - ABSOLUTE_ZERO_IN_CELSIUS)
#define CELSIUS(t) (t + ABSOLUTE_ZERO_IN_CELSIUS)
#define UNIVERSAL_GAS_CONSTANT 8.314
#define WATER_VAPOR_MOLAR_MASS 0.018016
#define DRY_AIR_MOLAR_MASS 0.028964
#define SPECIFIC_GAS_CONSTANT_DRY_AIR 287.058
#define STD_AIR_DENSITY_ICAO 1.22498
#define STD_AIR_DENSITY_ASM 1.20885

 // Standard deviation of the default muzzle velocity variation (0.3%)
#define DEFAULT_MUZZLE_VELOCITY_VARIATION_SD 0.003

#define BULLET_TRACE_MIN_VELOCITY 500

#define EXTENSION_REQUIRED_VERSION "1.0"
