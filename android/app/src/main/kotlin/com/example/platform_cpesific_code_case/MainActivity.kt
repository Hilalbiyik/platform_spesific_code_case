package com.example.platform_cpesific_code_case
import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodChannel
import android.app.Activity
import android.content.Intent
import android.net.Uri
import io.flutter.plugins.GeneratedPluginRegistrant
import android.content.Context
import android.content.ContextWrapper

import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.widget.Toast
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {

    private val CHANNELBATTERY = "samples.flutter.dev/battery"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNELBATTERY).setMethodCallHandler {
            // This method is invoked on the main thread.
                call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else if(call.method == "getSystemDetail"){
                val brandName=getSystemDetail()
                if (brandName != null) {
                    result.success(brandName)
                } else {
                    result.error("UNAVAILABLE", "System Details not available.", null)
                }
            }else{
                result.notImplemented()
            }
        }

    }

    private fun getMessage(): String {
        return "Message from Kotlin code"
    }

    private fun getSystemDetail(): String {
        return "Brand: ${Build.BRAND} \n" + "Model: ${Build.MODEL} \n"
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }
}