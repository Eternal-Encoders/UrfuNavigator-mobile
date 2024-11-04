package com.example.urfu_navigator_mobile;

import android.app.Application
import com.yandex.mapkit.MapKitFactory
import io.github.cdimascio.dotenv.dotenv;

val dotenv_key = dotenv{
    directory = "./assets"
    filename = "env" // instead of '.env', use 'env'
}["MAPKIT_API_KEY"]

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()

    MapKitFactory.setApiKey(dotenv_key)
  }
}