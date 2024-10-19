package com.example.urfu_navigator_mobile;

import android.app.Application

import com.yandex.mapkit.MapKitFactory

import api.*

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    // MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey(MAPKIT_API_KEY) // Your generated API key
  }
}