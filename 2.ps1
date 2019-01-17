reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x00000001 /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "<local>" /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d 201.48.194.210:80 /f
start-sleep –s 5
ping https://dl.google.com
$source = "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BCC6B1141-C9CD-8AFF-722E-1C4062F41BB6%7D%26lang%3Dru%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/chrome/install/ChromeStandaloneSetup64.exe"
$destination = "c:\chrome64.exe"
curl $source -Outfile $destination
Start-Process –FilePath “c:\chrome64.exe” –wait
start-sleep –s 5
Stop-Process -Name chrom*
$exe = “C:\Program Files (x86)\Google\Chrome\Application\chrome.exe”
$arg1 = “https://chrome.google.com/webstore/detail/hotspot-shield-vpn-free-p/nlbejmccbhkncgokjcmghpfloaajcffj?hl=ru”
$arg2 = “--start-maximized”
& $exe $arg2 $arg1
$sourc = "https://yandex.ru/soft/punto/download/?os=win”
$dest = "c:\punto.exe”
curl $sourc -Outfile $dest
Start-Process –FilePath “c:\punto.exe” –ArgumentList “/passive” –wait
$11 = "C:\Users\Administrator\AppData\Roaming\Yandex\Punto Switcher\User Data\"
$12 = "preferences.xml"
$13 = "LayoutFlags>No</Show"
$14 = "LayoutFlags>Yes</Show"
$prefs = $11 + $12
# формируем значения подлежащие замене
$userpref1old = $13
$userpref2old = "UsefulTips>Yes</ShowU"
# формируем новые значения
$userpref1new = $14
$userpref2new = "UsefulTips>No</ShowU"
# заменяем значения
(get-content $prefs) -replace [regex]::Escape($userpref1old), $userpref1new | set-content $prefs
(get-content $prefs) -replace [regex]::Escape($userpref2old), $userpref2new | set-content $prefs
Stop-Process -Name punt*
Stop-Process -Name ps64ld*
$puntoloc = "C:\Program Files (x86)\Yandex\punto.exe"
Start-Process –FilePath “C:\Program Files (x86)\Yandex\Punto Switcher\punto.exe”
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice' -Name ProgId -Value 'ChromeHTML'
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice' -Name ProgId -Value 'ChromeHTML'
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x00000000 /f
#nicely done!
