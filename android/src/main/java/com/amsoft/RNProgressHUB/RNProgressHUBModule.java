package com.amsoft.RNProgressHUB;


import android.app.Activity;
import android.os.Handler;
import android.util.Log;
import android.widget.TextView;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.kaopiz.kprogresshud.*;

/**
 *
 * Created by arnoma2015 on 16/9/13.
 */
public class RNProgressHUBModule  extends ReactContextBaseJavaModule {
    
    private KProgressHUD currentHud = null;

    public RNProgressHUBModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "RNProgressHUB";
    }


    @ReactMethod
    public void showSimpleText(String message, int duration) {

        //关闭上一个实例
        if(currentHud != null) {
            currentHud.dismiss();
            currentHud = null;
        };

        Activity activity = getCurrentActivity();

        TextView textView = new TextView(activity);
        textView.setText(message);
        textView.setTextColor(0xffffffff);
        textView.setTextSize(18.f);
        currentHud = KProgressHUD.create(activity)
                .setCustomView(textView)
                .show();
        scheduleDismiss(duration);
    }

    @ReactMethod
    public void showSpinIndeterminate(){
        if(currentHud != null) {
            currentHud.dismiss();
            currentHud = null;
        };


        currentHud = KProgressHUD.create(getCurrentActivity())
                .setStyle(KProgressHUD.Style.SPIN_INDETERMINATE)
                .show();

    }


    @ReactMethod
    public void showSpinIndeterminateWithTitle(String label){
        if(currentHud != null) {
            currentHud.dismiss();
            currentHud = null;
        };
        currentHud = KProgressHUD.create(getCurrentActivity())
                .setStyle(KProgressHUD.Style.SPIN_INDETERMINATE)
                .setLabel(label)
                .show();
    }

    @ReactMethod
    public void showSpinIndeterminateWithTitleAndDetails(String label, String details){
        if(currentHud != null) {
            currentHud.dismiss();
            currentHud = null;
        };
        currentHud = KProgressHUD.create(getCurrentActivity())
                .setStyle(KProgressHUD.Style.SPIN_INDETERMINATE)
                .setLabel(label)
                .setDetailsLabel(details)
                .show();
    }

    @ReactMethod
    public void showDeterminate(int mode, String title, String details){
        if(currentHud != null) {
            currentHud.dismiss();
            currentHud = null;
        }

//        String modeStr = String.valueOf(mode);

        currentHud = KProgressHUD.create(getCurrentActivity());
        currentHud.setMaxProgress(100);
        currentHud.setStyle(mode == 0 ? KProgressHUD.Style.ANNULAR_DETERMINATE : KProgressHUD.Style.BAR_DETERMINATE);
        if (title != null){
            currentHud.setLabel(title);
        }
        if (details != null){
            currentHud.setDetailsLabel(details);
        }
        currentHud.show();
    }

    @ReactMethod
    public void setProgress(float progress){
        if (currentHud != null){
            progress = progress * 100;
            currentHud.setProgress((int)progress);
        }
    }

    @ReactMethod
    public void dismiss(){
        if(currentHud != null){
            currentHud.dismiss();
        }
    }

    //定时关闭
    private void scheduleDismiss(int duration) {
        if(currentHud != null){
            Handler handler = new Handler();
            handler.postDelayed(new Runnable() {
                @Override
                public void run() {
                    if(currentHud != null){
                        currentHud.dismiss();
                        currentHud = null;
                    }
                }
            }, duration);
        }

    }


}
