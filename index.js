"use strict";

var RNProgressHUB = require('react-native').NativeModules.RNProgressHUB;
//var IsAndroid = RNProgressHUB.IsAndroid;


var determinateMode = {
    "annular":0,
    "bar":1
};

var ProgressHUB = function () {
    this.determinateMode = determinateMode["annular"];
};

ProgressHUB.prototype.setDeterminateMode = function (mode) {
    if(determinateMode[mode] !== null){
        this.determinateMode = determinateMode[mode];
    }
};
ProgressHUB.prototype.showSimpleText = function (message = 'default',duration = 2000) {
    RNProgressHUB.showSimpleText(message,duration);
};
ProgressHUB.prototype.dismiss = function () {
    RNProgressHUB.dismiss();
};
ProgressHUB.prototype.showSpinIndeterminate = function () {
     var args = [].slice.call(arguments);
    if(args.length === 0){
        RNProgressHUB.showSpinIndeterminate();
    } else if(args.length === 1 && typeof args[0] == 'string'){
        RNProgressHUB.showSpinIndeterminateWithTitle(args[0]);
    } else if(args.length === 2 && typeof args[0] == 'string' && typeof args[1] == 'string'){
        RNProgressHUB.showSpinIndeterminateWithTitleAndDetails(args[0],args[1]);
    } else {
        throw Error("params error");
    }
};
ProgressHUB.prototype.showDeterminate = function ({mode,title,details} = {}) {
    var modeIndex = 0;
    if(determinateMode[mode] !== null && determinateMode[mode] !== undefined){
        modeIndex = determinateMode[mode];
    } else {
        modeIndex = this.determinateMode;
    }
    RNProgressHUB.showDeterminate(modeIndex,title,details);
};
ProgressHUB.prototype.setProgress = function (progress) {
    if(typeof progress == 'number'){
        RNProgressHUB.setProgress(progress);
    } else {
        throw Error('params must Number type');
    }
};

export default new ProgressHUB();





