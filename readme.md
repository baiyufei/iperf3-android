compile iperf 3.6 for android

## require
- gyp
- ndk

## usage
1. ./configure-android.sh $path-to-ndk
2. adb push ./out_arm/Default/iperf3 /data/local/tmp/
3. adb shell && cd /data/local/tmp
4. run iperf4

