# react-native-progresshub 
[![npm version](https://img.shields.io/badge/npm-v3.8.6-red.svg)](https://www.npmjs.com/package/react-native-progresshub)

An implement of ProgressHUD for React-Native, similar to MBProgressHUD for iOS and KProgressHUD for Android.

## Installation

```
$ npm install react-native-progresshub --save
$ rnpm link
```



## Note about React requires

Since react-native 0.25.0, `React` should be required from `node_modules`.
React Native versions from 0.18 should be working out of the box, for lower
versions you should add `react` as a dependency in your `package.json`.


## Screenshot



## General Usage

```js
import RNProgressHUB from 'react-native-progresshub';
```
or

```js
var RNProgressHUB = require('react-native-progresshub');
```



===== API =====

Simple text with duration
```js
RNProgressHUB.showSimpleText("Message",2000);
```

Spinner Indeterminate
```js
RNProgressHUB.showSpinIndeterminate();
RNProgressHUB.showSpinIndeterminate("Title");
RNProgressHUB.showSpinIndeterminate("Title","Details");
```

Determinate loading
```js
    var progress = 0.1;

    RNProgressHUB.showDeterminate({
      mode:'bar', //"bar" or "annular"   default:"annular"
      title:"title", 
      details:"details"
    });

    var interval =  setInterval(function () {
      if(progress <= 1){
        RNProgress.setProgress(progress);
      } else {
        RNProgress.dismiss();
        clearInterval(interval);
      }
      progress += 0.1;
    },1000);
```

Progress within determinate
```js
RNProgressHUB.setProgress(progress); // progress: 0 ~ 1
```


Dismiss
```js
RNProgressHUB.dismiss();
```















