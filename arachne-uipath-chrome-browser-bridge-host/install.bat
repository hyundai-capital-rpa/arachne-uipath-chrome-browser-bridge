REG ADD "HKCU\Software\Google\Chrome\NativeMessagingHosts\com.arachne.uipath.chrome.browser.bridge.host" /ve /t REG_SZ /d "%~dp0host.json" /f
pip install cbnmplib