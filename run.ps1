# Seleniumスクリプト
#  (2025/02/12(水) 神山)作成
# 以下のサイトを参照
# https://seikogroup.sharepoint.com/:v:/s/IIMSS/EbOWS6xFU4pPsBhUsTX7FhoBG9Aw4mFUbZzL3yr6vRhkNg?e=5sm7Yg
# https://adamtheautomator.com/selenium-and-powershell/
#SParam($Username,$passoword,$url,$Username_xpath,$passoword_xpath,$click_name)
$Username="mkoyama@iim.co.jp"
$password="mkoyama@iim.co.jp"
$url="https://github.com/login"
$Username_xpath="//*[@id='login_field']"
$passoword_xpath="//*[@id='''password']"
$click_name="commit"
# if ($Username -eq "") {$Username="mkoyama@iim.co.jp"}
# if ($password -eq "") {$password="mkoyama@iim.co.jp"}
# if ($url -eq "") {$url="https://github.com/login"}
# if ($Username_xpath -eq "") {$Username_xpath="//*[@id='login_field']"}
# if ($passoword_xpath -eq "") {$passoword_xpath="//*[@id='password']"}
# if ($click_name -eq "") {$click_name="commit"}
Write-Host $Username
Write-Host $url
Write-Host $Username_xpath
Write-Host $passoword_xpath
# see https://www.kadinche.com/tech-blog/powershell-e3-81-a7selenium-webdriver-e3-82-92-e4-bd-bf-e3-81-86-e3-81-9f-e3-82-81-e3-81-ae-e5-8b-98-e6-89-80
$workingPath = 'C:\selenium'
$seleniumHome = 'C:\selenium'
$webDriverDllPath
$webDriverSupportDllPath
$webDriverDllPath = Convert-Path (Join-Path $seleniumHome "\Selenium.WebDriver.4.28.0\lib\netstandard2.0\WebDriver.dll")
$webDriverSupportDllPath = Convert-Path (Join-Path $seleniumHome "\Selenium.Support.4.28.0\lib\netstandard2.0\WebDriver.Support.dll")
Add-Type -Path $webDriverDllPath
Add-Type -Path $webDriverSupportDllPath

# Add the working directory to the environment path.
# This is required for the ChromeDriver to work.
if (($env:Path -split ';') -notcontains $workingPath) {
    $env:Path += ";$workingPath"
}
$ChromeDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver
# GoogleだとログインアイコンをクリックできないためGitに変更
$ChromeDriver.Navigate().GoToURL($url)
# ログイン
# $ChromeDriver.FindElement([OpenQa.Selenium.By]::xPath("$Username_xpath").SendKeys("$Username"))
# $ChromeDriver.FindElement([OpenQa.Selenium.By]::xpath("$passoword_xpath").SendKeys("$password"))
# $ChromeDriver.FindElement([OpenQa.Selenium.By]::name("$click_name").click())
$ChromeDriver.FindElement([OpenQa.Selenium.By]::xPath("//*[@id='login_field']")).SendKeys($Username)
$ChromeDriver.FindElement([OpenQa.Selenium.By]::xpath('//*[@id="password"]')).SendKeys($password)
$ChromeDriver.FindElement([OpenQa.Selenium.By]::name('commit')).click()
