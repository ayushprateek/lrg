package com.tbib_downloader.tbib_downloader;

import android.os.Environment;

import androidx.annotation.NonNull;

import java.io.File;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public final class TbibDownloaderPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), "tbib_downloader");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if ("getPlatformVersion".equals(call.method)) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if ("getDownloadsDirectory".equals(call.method)) {
            try {
                File downloadsDirectory = Environment.getExternalStoragePublicDirectory(
                        Environment.DIRECTORY_DOWNLOADS);
                result.success(downloadsDirectory.getAbsolutePath());
            } catch (Exception exception) {
                result.error("UNAVAILABLE", "Downloads directory not available.", null);
            }
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
    }
}
