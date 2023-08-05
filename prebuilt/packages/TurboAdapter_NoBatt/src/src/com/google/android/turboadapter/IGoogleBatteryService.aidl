package com.google.android.turboadapter;

import android.os.ResultReceiver;

interface IGoogleBatteryService {
    void getChargingStageAndDeadline(in ResultReceiver resultReceiver);

    void getProperty(int i, int i2, in ResultReceiver resultReceiver);

    String getVersion();

    boolean isAdaptiveChargingEnabled();

    boolean setChargingDeadline(int i);

    boolean setProperty(int i, int i2, int i3);
}
