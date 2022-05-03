# arachne-uipath chrome browser bridge
> **author** : youngseop-kim <br>
> **project** : arachne-uipath

**[about arachne-uipath chrome browser bridge](#about-arachne-uipath-chrome-browser-bridge)**

**[prepare arachne-uipath chrome browser bridge](#prepare-arachne-uipath-chrome-browser-bridge)**

**[arachne-uipath chrome browser bridge application](#arachne-uipath-chrome-browser-bridge-application)**

**[arachne-uipath chrome browser bridge host](#arachne-uipath-chrome-browser-bridge-host)**

**[arachne-uipath chrome browser bridge client](#arachne-uipath-chrome-browser-bridge-client)**

**[chrome browser native messaging pipeline library](#chrome-browser-native-messaging-pipeline-library)**

**[publish history](#publish-history)**

<br>

---

<br>

## **about arachne-uipath chrome browser bridge**

### **what it does**
&nbsp; &nbsp; **arachne-uipath chrome browser bridge** (hereinafter referred to as the bridge) makes the chrome browser enable to communicate with an external application by hosting native messaging pipeline. as the chrome extension only takes the part of scripting and returing results, please make sure that it does not provide any functionality without the host application which is also known as "native application" described in the official document for chrome extension. you may create your own native application which of name is "com.arachne.uipath.chrome.browser.bridge.host" and allowed to accept stdio, or you may use the native application uploaded in this respository. 

&nbsp; &nbsp; finally, we have one thing left before using the bridge. although a decision where a port from the host application opens depends on users, we strongly recommend **the communication with an external application should be opened in a localhost**, not in public. even if you have to open your port in public, you should aware that it is very dangerous behavior for the security. it does not support any encryption for messages because it is not considered any functionality for the public communication, only for the localhost communication from the steps of development.

&nbsp; &nbsp; if you are ready to use the bridge, please follow the steps described in **[prepare arachne-uipath chrome browser bridge](#prepare-arachne-uipath-chrome-browser-bridge)**. these steps are based on the host application uploaded in this repository.

### **how it works**

![how it works](reference/how-it-works.png)

**chrome browser side**
1. chrome browser start-up
2. chrome browser executes the bridge application (`chrome extension`)
3. the bridge application start-up
4. the bridge application executes the bridge host (`native application`)
5. the bridge host start-up
6. the bridge host start to listen on message
7. if the bridge host is requested, <br>
   7-1. the bridge host requests to the bridge application to execute javascript <br>
   7-2. the bridge application executes the javascript <br>
   7-3. the bridge application returns the result to the bridge host <br>
   7-4. the bridge host responses to an external process <br>
   7-5. move to step 6 <br>

**external process side**
1. an external process requests javascript to inject to the bridge host 
2. an external process waits for response from the bridge host

**message in each communcation**

```javascript
/*
=== 1. an external process ===
"key" will be generated in the brige host.
"value" is a javascript to inject.
*/ 
message = {
    "key" : "", 
    "value" : "javascript"
    }

/*
=== 2. the bridge host ===
"key" is generated in uuid4 format to identify the request.
"value" is replaced with a javascript file name
which of content is requested javascript from an external process.
*/
message = {
    "key" : "uuid4", 
    "value" : "javascript file name"
    }

/*
=== 3. the bridge application ===
"value" is replaced with a javascript result.
this is the final message an external process will be received as response.
*/
message = {
    "key" : "uuid4", 
    "value" : "javascript result (serialized json)"
    }
```

<br>

---

<br>

## **prepare arachne-uipath chrome browser bridge**

**1. install the bridge in the chrome browser** : https://chrome.google.com/webstore/detail/arachneuipathchromebrowse/dcgmnehcnnncofekjjoikncbikojekje

**2. install the host configuration file on your registry**

how to install "host.json" on your registry <br>
with installing chrome browser native messaging pipeline library

```console
> cd "move\to\host\app\directory"
> install.bat
```

how to uninstall "host.json" on your registry <br>
with uninstalling chrome browser native messaging pipeline library

```console
> cd "move\to\host\app\directory"
> uninstall.bat
```

**3. install python library for the host application**

how to install chrome native messaging pipeline library from pypi
```console
> pip install cbnmplib
```

**4. restart the chrome browser**

<br>

---

<br>

## **arachne-uipath chrome browser bridge application**

> **language** <br>
> &nbsp; &nbsp; - javascript (tested on v8 10.0.139.13) <br>
> 
> **browser** <br> 
> &nbsp; &nbsp; - chrome (tested on v100.0.4896.88 64bit)
> 
> **operating system** <br>
> &nbsp; &nbsp; - windows 10 (tested on v1809 64bit) <br>

**chrome extension**
- id : dcgmnehcnnncofekjjoikncbikojekje
- name : arachne.uipath.chrome.browser.bridge.app
- it is developed in manifest v3 with following permissions described as below, <br> 
"script" : "activeTab", "scripting", "nativeMessaging" <br> 
"host" : "http", "https"

&nbsp; &nbsp; the bridge application is a `chrome extension` which does only three simple behavior "executing the bridge host", "executing a javascript", and "returning a javascript result".

&nbsp; &nbsp; to make the bridge application to communicate with an external process, the bridge host should be needed which is also known as "native application" described in the official document for chrome extension. so the bridge application executes the bridge host only on chrome browser start-up.

&nbsp; &nbsp; after executing the bridge host, the bridge application starts to listen on message request and it means now you are ready to communcate with an external process. if the bridge host is running with no error, whenever the bridge application receives the message from an external process via the bridge host, it will execute a javascript on current chrome browser tab and return the result for the javascript execution.

<br>

---

<br>

## **arachne-uipath chrome browser bridge host**
> **language** <br> 
> &nbsp; &nbsp; - python (tested on v3.9.0 64bit) <br>
> 
> **operating system** <br>
> &nbsp; &nbsp; - windows 10 (tested on v1809 64bit) <br>

_update as soon as possible..._

<br>

---

<br>

## **arachne-uipath chrome browser bridge client**
> **language** <br> 
> &nbsp; &nbsp; - python (tested on v3.9.0 64bit) <br>
> 
> **operating system** <br>
> &nbsp; &nbsp; - windows 10 (tested on v1809 64bit) <br>

_update as soon as possible..._

<br>

---

<br>

## **chrome browser native messaging pipeline library**
> **language** <br> 
> &nbsp; &nbsp; - python (tested on v3.9.0 64bit) <br>
> 
> **operating system** <br>
> &nbsp; &nbsp; - windows 10 (tested on v1809 64bit) <br>

_update as soon as possible..._

<br>

---

<br>

## **publish history**

updated on 2022-04-18
- modified : do connect only on startup
- modified : add a connection retrial condition (host forbidden error)
```
<annotation>
need to be watched about calling the host application twice issue (BUG FOUND)
```

updated on 2022-04-26
- modified : update version 0.1 to 0.2 in mainfest
- modified : change chrome extension logo
```
<annotation>
as I forgot uploading the package file on chrome web store publish, 
the modified source on 2022-04-18 did not published properly.
so modified source will be applied on this publish (updated version 0.1 to version 0.2)
```

<br>

---

<br>
