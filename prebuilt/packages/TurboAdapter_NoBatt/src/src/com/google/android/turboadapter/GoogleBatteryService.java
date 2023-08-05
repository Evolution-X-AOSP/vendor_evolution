package com.google.android.turboadapter;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.ResultReceiver;

public class GoogleBatteryService extends Service {
    private GoogleBatteryProxyDummy mBinder;

    IBinder bindToGoogleBatteryProxyDummy() {
        if (mBinder == null) {
            mBinder = new GoogleBatteryProxyDummy(this);
        }
        return mBinder;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return bindToGoogleBatteryProxyDummy();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    @Override
    public boolean onUnbind(Intent intent) {
        mBinder = null;
        return false;
    }

    public class GoogleBatteryProxyDummy extends IGoogleBatteryService.Stub {
        final GoogleBatteryService googleBatteryService;

        GoogleBatteryProxyDummy(GoogleBatteryService googleBatteryService) {
            this.googleBatteryService = googleBatteryService;
        }

        @Override
        public void getChargingStageAndDeadline(ResultReceiver resultReceiver) {
        }

        @Override
        public void getProperty(int i, int i2, ResultReceiver resultReceiver) {
        }

        @Override
        public String getVersion() {
            return "3";
        }

        @Override
        public boolean isAdaptiveChargingEnabled() {
            return false;
        }

        @Override
        public boolean setChargingDeadline(int i) {
            return false;
        }

        @Override
        public boolean setProperty(int i, int i2, int i3) {
            return false;
        }
    }
}
