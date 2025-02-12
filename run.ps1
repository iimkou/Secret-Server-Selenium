# Seleniumスクリプト
#  (2025/02/12(水) 神山)作成
# 以下のサイトを参照
# https://seikogroup.sharepoint.com/:v:/s/IIMSS/EbOWS6xFU4pPsBhUsTX7FhoBG9Aw4mFUbZzL3yr6vRhkNg?e=5sm7Yg
# https://adamtheautomator.com/selenium-and-powershell/
Param(
    [string]$Username= "mkoyama@iim.co.jp",
    [string]$Pass="mkoyama@iim.co.jp",
    [string]$url="https://github.com/login"
    # [string]$Username_xpath="//*[@id='login_field']",
    # [string]$passoword_xpath="//*[@id='login_field']",
    # [string]$click_name="commit"
    )
# see https://www.kadinche.com/tech-blog/powershell-e3-81-a7selenium-webdriver-e3-82-92-e4-bd-bf-e3-81-86-e3-81-9f-e3-82-81-e3-81-ae-e5-8b-98-e6-89-80
# $workingPath = 'C:\selenium'
$seleniumHome = 'C:\selenium'
# DLLを読み込む
$webDriverDllPath=(Get-ChildItem -Path $seleniumHome -Filter WebDriver.dll -Recurse).FullName
$webDriverSupportDllPath=(Get-ChildItem -Path $seleniumHome -Filter WebDriver.Support.dll -Recurse).FullName
Add-Type -Path $webDriverDllPath
Add-Type -Path $webDriverSupportDllPath

# Chomeに対してバスをとおす
$chome_dir = (Get-ChildItem -Path $seleniumHome  -Filter chrome.exe -Recurse).DirectoryName  
if (($env:Path -split ';') -notcontains $chome_dir){
    $env:Path += ";$chome_dir"
}
# if (($env:Path -split ';') -notcontains $workingPath) {
#     $env:Path += ";$workingPath"
# }
$ChromeDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver
# GoogleだとログインアイコンをクリックできないためGitに変更
$ChromeDriver.Navigate().GoToURL($url)
# ログイン
# $ChromeDriver.FindElement([OpenQa.Selenium.By]::xPath("$Username_xpath").SendKeys("$Username"))
# $ChromeDriver.FindElement([OpenQa.Selenium.By]::xpath("$passoword_xSSpath").SendKeys("$password"))
# $ChromeDriver.FindElement([OpenQa.Selenium.By]::name("$click_name").click())
$ChromeDriver.FindElement([OpenQa.Selenium.By]::xPath("//*[@id='login_field']")).SendKeys($Username)
$ChromeDriver.FindElement([OpenQa.Selenium.By]::xpath('//*[@id="password"]')).SendKeys($pass)
$ChromeDriver.FindElement([OpenQa.Selenium.By]::name('commit')).click()
