package com.demo.helloaddtoapp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.idlefish.flutterboost.containers.BoostFlutterActivity;

import java.util.HashMap;
import java.util.Map;

/**
 * description:
 * <p>
 * Created by ethan on 2020/10/19.
 */
public class PageRouter {

    public final static Map<String, String> pageName = new HashMap<String, String>() {{

        put("first", "first");
        put("second", "second");
        put("mypage", "mypage");
        put("myfish", "myfish");
        put("sliverdemo", "sliverdemo");
        put("tab", "tab");
        put("sample://flutterPage", "flutterPage");
    }};

    public static final String NATIVE_PAGE_URL = "sample://nativePage";
    public static final String FLUTTER_PAGE_URL = "sample://flutterPage";
    public static final String FLUTTER_FRAGMENT_PAGE_URL = "sample://flutterFragmentPage";

    public static boolean openPageByUrl(Context context, String url, Map params) {
        return openPageByUrl(context, url, params, 0);
    }

    public static boolean openPageByUrl(Context context, String url, Map params, int requestCode) {

        String path = url.split("\\?")[0];

        Log.i("openPageByUrl",path);

        try {
            if (pageName.containsKey(path)) {
                Intent intent = BoostFlutterActivity.withNewEngine().url(pageName.get(path)).params(params)
                        .backgroundMode(BoostFlutterActivity.BackgroundMode.opaque).build(context);
                if(context instanceof Activity){
                    Activity activity=(Activity)context;
                    activity.startActivityForResult(intent,requestCode);
                }else{
                    context.startActivity(intent);
                }
                return true;
            } else if (url.startsWith(FLUTTER_FRAGMENT_PAGE_URL)) {
                context.startActivity(new Intent(context, FlutterFragmentPageActivity.class));
                return true;
            } else if (url.startsWith(NATIVE_PAGE_URL)) {
                context.startActivity(new Intent(context, NativePageActivity.class));
                return true;
            }

            return false;

        } catch (Throwable t) {
            Log.d("FlutterBoost", "找不到path:" + path);
            return false;
        }
    }

}
