# Secret Server でのSelenium環境構築

PowerShellからSeleniumを起動する方法についてまとめる。

## ディレクトリ構造
c:\selenuim

C:\selenium\chrome.exe
 テスト用chrome本体
 https://googlechromelabs.github.io/chrome-for-testing/
 　よりダウンロード
 
 C:\selenium\script
　スクリプト
C:\selenium\Selenium.WebDriver.4.28.0
https://www.selenium.dev/downloads/
の .net/c# より取得
nuget.exe を取得して
>nuget install Selenium.WebDriver
>nuget install Selenium.Support
>nuget install Selenium.WebDriver.
ChromeDriver

としたほうがいいかも。
C:\selenium\Selenium.WebDriver.4.28.0\lib
から、「net8.0」を削除

C:\selenium\Selenium.Support.4.28.0
必要ないかも,,




  

* Windows10/Windows2019サーバの場合、標準のPowerShellが、v5.0となっているため、v7を参照する必要あり *
  
これではまった。Visual Studio Codeだとうまく行くがコマンドラインから実行するとエラーになっていた。

### 参照
[Seleniumの打合せ] (https://seikogroup.sharepoint.com/:v:/s/IIMSS/EbOWS6xFU4pPsBhUsTX7FhoBG9Aw4mFUbZzL3yr6vRhkNg?e=5sm7Yg)

Ching SongさんのYouTubeだと文字のみで解説がないが、上記Teams録画だと、説明やスクリプトの説明がある。


[SeleniumをPowerShellでの使い方]( https://adamtheautomator.com/selenium-and-powershell/)

上記URLで参照されていたサイト
