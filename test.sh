#!/bin/sh

MDTOOL="/Applications/Xamarin Studio.app/Contents/MacOS/mdtool"

cd out
rm -r latest
rm -r temp
unzip -o *.xam -d temp
mv temp/* latest
rmdir temp

# Build samples

"$MDTOOL" build "--configuration:Debug" latest/samples/OxyPlotSample.iOS/OxyPlotSample.iOS.sln > test-ios-debug.log
if [ $? -ne 0 ]; then 
	echo "iOS/Debug: failed"
else 
	echo "iOS/Debug: OK"
fi

"$MDTOOL" build "--configuration:Debug" latest/samples/OxyPlotSample.Android/OxyPlotSample.Android.sln > test-android-debug.log
if [ $? -ne 0 ]; then 
	echo "Android/Debug: failed"
else 
	echo "Android/Debug: OK"
fi

"$MDTOOL" build "--configuration:Release" latest/samples/OxyPlotSample.iOS/OxyPlotSample.iOS.sln > test-ios-release.log
if [ $? -ne 0 ]; then 
	echo "iOS/Release: failed"
else 
	echo "iOS/Release: OK"
fi

"$MDTOOL" build "--configuration:Release" latest/samples/OxyPlotSample.Android/OxyPlotSample.Android.sln > test-android-release.log
if [ $? -ne 0 ]; then 
	echo "Android/Release: failed"
else 
	echo "Android/Release: OK"
fi

cd ..
