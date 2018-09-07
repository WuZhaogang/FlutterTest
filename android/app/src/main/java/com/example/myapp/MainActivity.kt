package com.example.myapp

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        registerCustomPlugin(this)
    }

    private fun registerCustomPlugin(registrar: PluginRegistry) {

        JumpToAcPlugin.registerWith(registrar.registrarFor(JumpToAcPlugin.CHANNEL))

        FlutterPluginCounter.registerWith(registrar.registrarFor(FlutterPluginCounter.CHANNEL))
    }

}
