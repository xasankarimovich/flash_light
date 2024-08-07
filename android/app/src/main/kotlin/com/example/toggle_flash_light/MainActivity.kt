package com.example.toggle_flash_light

import android.content.Context
import android.hardware.camera2.CameraAccessException
import android.hardware.camera2.CameraManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val CHANNEL = "samples.flutter.dev/flashlight"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
      if (call.method == "toggleFlashlight") {
        val isOn = call.argument<Boolean>("isOn") ?: false
        val success = toggleFlashlight(isOn)
        if (success) {
          result.success(isOn)
        } else {
          result.error("UNAVAILABLE", "Flashlight not available", null)
        }
      } else {
        result.notImplemented()
      }
    }
  }

  private fun toggleFlashlight(isOn: Boolean): Boolean {
    val cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
    return try {
      val cameraId = cameraManager.cameraIdList[0] // Usually, the first camera is the back camera with a flashlight.
      cameraManager.setTorchMode(cameraId, isOn)
      true
    } catch (e: CameraAccessException) {
      e.printStackTrace()
      false
    }
  }
}
