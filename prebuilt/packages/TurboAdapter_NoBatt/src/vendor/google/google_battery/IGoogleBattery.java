package vendor.google.google_battery;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;

public interface IGoogleBattery extends IInterface {
    ChargingStage getChargingStageAndDeadline() throws RemoteException;

    int getProperty(int i, int i2) throws RemoteException;

    void setChargingDeadline(int i) throws RemoteException;

    void setProperty(int i, int i2, int i3) throws RemoteException;

    public static abstract class Stub extends Binder implements IGoogleBattery {
        public static IGoogleBattery asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            return new Proxy(iBinder);
        }

        private static class Proxy implements IGoogleBattery {
            private IBinder mRemote;

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override
            public IBinder asBinder() {
                return this.mRemote;
            }

            @Override
            public void setChargingDeadline(int i) throws RemoteException {
                /* Do nothing */
            }

            @Override
            public ChargingStage getChargingStageAndDeadline() throws RemoteException {
                return null;
            }

            @Override
            public int getProperty(int i, int i2) throws RemoteException {
                return 0;
            }

            @Override
            public void setProperty(int i, int i2, int i3) throws RemoteException {
                /* Do nothing */
            }
        }
    }
}
