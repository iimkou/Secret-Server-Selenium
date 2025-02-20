# Secret Server でのSelenium環境構築

PowerShellからSeleniumを起動する方法についてまとめる。

## ディレクトリ構造
## c:\selenuim トップフォルダ

Chromeおよびスクリプト配置フォルダ。PowerShellで参照しているため
変更する場合は、スクリプトの修正が必用

## C:\selenium\chrome-win64\
 テスト用chrome本体

 https://googlechromelabs.github.io/chrome-for-testing/
よりダウンロード
 
##  C:\selenium\script

本スクリプトの配置フォルダ

### C:\selenium\Selenium.WebDriver.4.28.0
### C:\selenium\selenium.support.4.28.0
Seleniumのドライバー本体


Seleniumのドライバー本体取得方法

### 取得方法1 
　https://www.selenium.dev/downloads/
　よりダウンロード。nukpg形式であるため、zip形式にして展開

### 取得方法2 nugetで更新　→　本来はこれがおおすすめ
https://learn.microsoft.com/ja-jp/nuget/consume-packages/install-use-packages-nuget-cli
ページの　nuget.org 　から取得をクリックして、
c:\windows\system にコピーする。カレントでもいいけど。

nuget.exe を取得して
>nuget install Selenium.WebDriver

>nuget install Selenium.Support

>nuget install Selenium.WebDriver.
ChromeDriver

としたほうがいいかも。
ただし、C:\selenium\Selenium.WebDriver.4.28.0\lib
から、「net8.0」を削除。net2.0のドライバーを利用するため

### 参照
[Seleniumの打合せ] (https://seikogroup.sharepoint.com/:v:/s/IIMSS/EbOWS6xFU4pPsBhUsTX7FhoBG9Aw4mFUbZzL3yr6vRhkNg?e=5sm7Yg)

Ching SongさんのYouTubeだと文字のみで解説がないが、上記Teams録画だと、説明やスクリプトの説明がある。


[SeleniumをPowerShellでの使い方]( https://adamtheautomator.com/selenium-and-powershell/)

上記URLで参照されていたサイト




  
## 以下奮闘記

* Windows10/Windows2019サーバの場合、標準のPowerShellが、v5.0となっているため、v7を参照する必要あり *
  
これではまった。Visual Studio Codeだとうまく行くがコマンドラインから実行するとエラーになっていた。



### Windows11のIIM神山環境に構築しようとした場合、以下のエラーがでる。(2025/02/19(水) 神山)

New-Object: C:\Selenium\script\Secret-Server-Selenium\run.ps1:31:17
Line |
  31 |  $ChromeDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver
     |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     | Exception calling ".ctor" with "0" argument(s): "Unable to locate or obtain Selenium Manager binary at C:\Program
     | Files\PowerShell\7\selenium-manager\windows\selenium-manager.exe"
InvalidOperation: C:\Selenium\script\Secret-Server-Selenium\run.ps1:33:1

このため、dotnet CLIのインストールからやり直す

https://learn.microsoft.com/ja-jp/nuget/quickstart/install-and-use-a-package-using-the-dotnet-cli

の右上「NETをダウンロードする」をクリックしてダウンロードを実施。インストールする。

### 
https://dotnet.microsoft.com/ja-jp/learn/dotnet/hello-world-tutorial/install
の「.NET WinGet 構成ファイル 」をダウンロードして手順どおりに構成する。

## なんかうまくいかないのでnugetで再チャレンジ

PS C:\Windows\System32> nuget
警告: ファイルまたはアセンブリ 'Windows.Devices.Printers.Extensions.dll'、またはその依存関係の 1 つが読み込めませんでし た。モジュールはアセンブリ マニフェストを含んでいなければなりません。

のエラーが発生

原因は、C:\windows\System32 に nuget.exeを入れていたため。
c:\Windows\System に移動すれば解決


> PS C:\Selenium> .\nuget.exe install Selenium.WebDriver
> Feeds used:
> パッケージ 'Selenium.WebDriver' を 'C:\Selenium' にインストールしています。
> パッケージ 'Selenium.WebDriver' が見つかりません


C:\Users\mkoyama\AppData\Roaming\NuGet\Nuget.config
が壊れている。削除して、再度nugetを実行すればoK(2025/02/19(水) 神山)


## やっぱりSelenium-Managerがインストールできない
仕方ないので動作しているHyper-Vマシンから、以下のフォルダをコピー(2025/02/19(水) 神山)
C:\Program Files\PowerShell\7\selenium-manager

とりあえず、動作した。(2025/02/19(水) 神山)

## ところがコマンドプロンプトから実行しようとすると以下のエラーが発生
###  

### add-typeでロードエラーが発生
コマンドプロンプトで
 powershll
 はv5
 pwsh
 は、v7
なのでv7から実行れされるようにプログラム名を変更