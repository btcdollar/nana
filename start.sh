#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
sshd
su -c dumpsys battery set level 100
su -c svc power stayon true
su -c dumpsys deviceidle whitelist +com.termux
su -c settings put global system_capabilities 100
su -c settings put global sem_enhanced_cpu_responsiveness 1
su -c settings put global adaptive_battery_management_enable 0
su -c settings put global adaptive_power_saving_setting 0
su -c dumpsys battery set temp 300
su -c settings put secure allow_more_heat_value 80
su -c settings put global enhanced_processing 2
su -c settings put global wifi_sleep_policy 2
su -c settings put global restricted_device_performance 0,0
su -c "echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
~/ccminer/ccminer -c ~/ccminer/config.json
