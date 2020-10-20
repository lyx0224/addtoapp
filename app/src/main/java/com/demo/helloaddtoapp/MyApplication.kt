package com.demo.helloaddtoapp

import android.app.Application
import android.content.Context
import android.os.Build
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.Utils
import com.idlefish.flutterboost.interfaces.INativeRouter
import io.flutter.embedding.android.FlutterView
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec

/**
 *
 * description:混合开发的host app
 *
 * Created by ethan on 2020/10/19.
 */
class MyApplication : Application() {

    override fun onCreate() {
        super.onCreate()

        val router = INativeRouter { context, url, urlParam, p3, p4 ->
            val assembleUrl: String = Utils.assembleUrl(url, urlParam)
            PageRouter.openPageByUrl(context, assembleUrl, urlParam)
        }

        val lifeCyclerListenr = object : FlutterBoost.BoostLifecycleListener {
            override fun onEngineCreated() {
                val methodChannel = MethodChannel(FlutterBoost.instance().engineProvider().dartExecutor, "flutter_native_channel")
                methodChannel.setMethodCallHandler { call, result ->
                    if (call.method == "getPlatformVersion") {
                        result.success(Build.VERSION.RELEASE)
                    } else {
                        result.notImplemented()
                    }
                }

                FlutterBoost.instance().engineProvider().platformViewsController.registry.registerViewFactory("plugins.test/view", TextPlatformViewFactory(StandardMessageCodec.INSTANCE))
            }

            override fun onPluginsRegistered() {
            }

            override fun beforeCreateEngine() {
            }

            override fun onEngineDestroy() {
            }

        }

        val platform = FlutterBoost.ConfigBuilder(this, router)
                .isDebug(true)
                .whenEngineStart(FlutterBoost.ConfigBuilder.ANY_ACTIVITY_CREATED)
                .renderMode(FlutterView.RenderMode.texture)
                .lifecycleListener(lifeCyclerListenr)
                .build()

        FlutterBoost.instance().init(platform)

    }

}