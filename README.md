# murray-tweaks
A Magisk module to tweak the default configuration for the Sony Xperia 10 IV (murray).

This module changes the following config options:
Option | Explanation
---|---
`config_nightDisplayColorTemperatureMin` | Set to `-2500` to allow increasing the blue light filter intensity to the extreme where only the red channel is used.
`config_nightDisplayColorTemperatureCoefficients`<br/>`config_nightDisplayColorTemperatureCoefficientsNative` | Change back to default values from AOSP - Sony have changed them and increased the blue channel y-intercept to be positive, which causes the screen to turn magenta instead of red at very low night display colour temperatures.
`config_dozeAlwaysOnEnabled` | Change to `true` - Sony has this set to `false` by default for some reason with no way to enable it from settings. Enabling this allows notifications to wake the screen up when locked.
`config_defaultNotificationLedOn`<br/>`config_defaultNotificationLedOff` | Change back to default values from AOSP - reduces the delay between notification LED flashes and increases the amount of time it is on for.
`config_notificationsBatteryLowARGB`<br/>`config_notificationsBatteryMediumARGB`<br/>`config_notificationsBatteryFullARGB` | Reduce brightness of each colour to 10% to reduce the brightness of the notification LED when charging

## To Do
The following is a list of things I would like this module to do that haven't been implemented yet:

- Allow disabling the persistent battery care notification. I'm not sure how this done. There is a config option for defining apps for which notifications cannot be disabled (`config_nonBlockableNotificationPackages`), however I have tried overriding this and the notification still cannot be disabled. It is possible that the notification is being implemented in a different way (based on the smali the notification is set as "ongoing"), or that my overlay is being overlaid by something else with a higher priority.