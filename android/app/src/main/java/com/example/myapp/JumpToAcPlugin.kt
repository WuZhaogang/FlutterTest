package com.example.myapp

import android.app.Activity
import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry


/**
 * 类描述:
 * 创建人:    wzg
 * 创建时间:  2018/9/6
 * 修改备注:  说明本次修改内容
 */
class JumpToAcPlugin(private var activity: Activity?) : MethodChannel.MethodCallHandler {


    companion object {

        val CHANNEL = "com.wzg.jump/plugin"

        var channel: MethodChannel? = null

        fun registerWith(registrar: PluginRegistry.Registrar) {
            channel = MethodChannel(registrar.messenger(), CHANNEL)
            val instance = JumpToAcPlugin(registrar.activity())
            //setMethodCallHandler在此通道上接收方法调用的回调
            channel?.setMethodCallHandler(instance)
        }

    }

    override fun onMethodCall(p0: MethodCall?, p1: MethodChannel.Result?) {
        when (p0?.method) {
            "acOne" -> {
                activity?.startActivity(Intent(activity!!, AcOne::class.java))
                p1?.success("success")
            }
        }
    }


}