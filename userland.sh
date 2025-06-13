#!/system/bin/sh
sleep 40
input keyevent KEYCODE_WAKEUP
sleep 2
input keyevent KEYCODE_SPACE
sleep 3
am start -n tech.ula/.MainActivity
​sleep 50
input text password
sleep 5
input keyevent KEYCODE_ENTER
​sleep 1
input text password
sleep 5
input keyevent KEYCODE_ENTER
​sleep 1
su -c dumpsys battery set level 100
su -c svc power stayon true
su -c dumpsys deviceidle whitelist +tech.ula
su -c settings put global system_capabilities 100
su -c settings put global sem_enhanced_cpu_responsiveness 1
su -c settings put global adaptive_battery_management_enable 0
​su -c settings put global adaptive_power_saving_setting 0
su -c dumpsys battery set temp 300
su -c dumpsys battery set usb 0
su -c settings put secure allow_more_heat_value 80
su -c settings put global enhanced_processing 2
su -c settings put global wifi_sleep_policy 2
su -c settings put global restricted_device_performance 0,0
su -c "echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
​sleep 1
exit 0
