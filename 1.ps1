# Удаляем лишних пользователей
Net user Admin /delete
Net user LabAdmin /delete
# Отключаем брандмауэр
Set-NetFirewallProfile -All -Enabled False
# Оставляем только русский и английский языки
Set-WinUserLanguageList -LanguageList ru, en-US –Force
# Устанавливаем русский язык для программ, не поддерживающих Юникод 
Set-WinSystemLocale ru
# Устанавливаем русский язык интерфейса
Set-WinUILanguageOverride ru
# Устанавливаем регион Россия
Set-WinHomeLocation 203
# устанавливаем английский язык ввода по умолчанию
Set-WinDefaultInputMethodOverride "0409:00000409"
# Включаем отображение секунд на часах в трее
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f
# Устанавливаем Московский часовой пояс
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v TimeZoneKeyName /t REG_SZ /d "Russian Standard Time" /f
# Отключаем прозрачность Windows
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
# Отключаем автоматическое скрытие полос прокрутки Windows
REG ADD "HKCU\Control Panel\Accessibility" /v DynamicScrollbars /t REG_DWORD /d 0 /f
# Удаляем из автозапуска OneDrive и WindowsDefender
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /f
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v SecurityHealth /f
# Удаляем из автозагрузки подключение сетевого диска
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\MapDrive - Shortcut.lnk"
# Удаляем "левую" задачу из планировщика и исправляем ее деятельность
schtasks /Delete /F /TN "\Microsoft\Windows\VMAS\Disable Clip and Drives"
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fDisableCcm /f
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fDisableCdm /f
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fDisableClip /f
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fDisableCpm /f
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fDisableLPT /f
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fForceClientLptDef /f
REG ADD "HKCU\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v fDisableClip /t REG_DWORD /d 0 /f
REG ADD "HKCU\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v fDisableCdm /t REG_DWORD /d 0 /f
REG ADD "HKCU\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v fAutoClientDrives /t REG_DWORD /d 1 /f
REG ADD "HKCU\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v MaxIdleTime /t REG_DWORD /d 0 /f
# Отключаем WindowsDefender  через  политики
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v AllowFastServiceStartup /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingOverrideSpynetReporting /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f
# Отключаем телеметрию через политики
REG ADD "HKLM\ SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry  /t REG_DWORD /d 0 /f
# Запрещаем авто обновление через политики
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsUpdate\AU" /v RebootRelaunchTimeoutEnabled /t REG_DWORD /d 0 /f
# Отключаем прятать значки в таскабре
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray /t REG_DWORD /d 0 /f
# Отключаем лишние службы
Set-Service SysMain -StartupType Disabled
Set-Service Spooler -StartupType Disabled
Set-Service SEMgrSvc -StartupType Disabled
Set-Service TrkWks -StartupType Disabled
Set-Service ShellHWDetection -StartupType Disabled
Set-Service wlidsvc -StartupType Disabled
Set-Service NcbService -StartupType Disabled
Set-Service CertPropSvc -StartupType Disabled
Set-Service lfsvc -StartupType Disabled
Set-Service ScDeviceEnum -StartupType Disabled
Set-Service DPS -StartupType Disabled
Set-Service PcaSvc -StartupType Disabled
Set-Service BITS -StartupType Disabled
Set-Service DiagTrack -StartupType Disabled
Set-Service wuauserv -StartupType Disabled
# Перезагружаем систему
Restart-Computer
