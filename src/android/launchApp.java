package com.ogangi.launchApp;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;

public class launchApp extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

      if(action.equals("launchApp")){
        String packageName = args.getJSONObject(0).getString("packageName");
        String url = args.getJSONObject(0).getString("url");
        this.launch(packageName,url,callbackContext);
        return true;
      }else if(action.equals("checkApp")){
        String packageName = args.getJSONObject(0).getString("packageName");
        this.checkApp(packageName, callbackContext);
        return true;
      }
      return false;
    }

    // Thanks to http://floresosvaldo.com/android-cordova-plugin-checking-if-an-app-exists
    public boolean appInstalled(String uri) {
      Context ctx = this.cordova.getActivity().getApplicationContext();
      final PackageManager pm = ctx.getPackageManager();
      boolean app_installed = false;
      try {
        pm.getPackageInfo(uri, PackageManager.GET_ACTIVITIES);
        app_installed = true;
      }
      catch(PackageManager.NameNotFoundException e) {
        app_installed = false;
      }
      return app_installed;
    }

  private void checkApp(String uri, CallbackContext callbackContext) {
    if(appInstalled(uri)) {
      callbackContext.success();
    }
    else {
      callbackContext.error("");
    }
  }

  private void launch(String packageName, String url,CallbackContext callback){
    Context ctx = this.cordova.getActivity().getApplicationContext();
    final PackageManager pm = ctx.getPackageManager();
    Intent intent = pm.getLaunchIntentForPackage(packageName);

    if (intent != null) {
      // We found the activity now start the activity
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      ctx.startActivity(intent);
    } else {
      // Open webBrowser
      intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      ctx.startActivity(intent);
    }
    callback.success();
  }
}
