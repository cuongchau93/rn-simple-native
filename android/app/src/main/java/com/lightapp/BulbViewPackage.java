package com.lightapp;

import androidx.annotation.NonNull;

import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.lightapp.BulbView;

import java.util.Map;


class BulbViewManager extends SimpleViewManager<BulbView> {

    @NonNull
    @Override
    public String getName() {
        return "BulbView";
    }

    @ReactProp(name="isOn")
    public void setBulbStatus(BulbView bulbView, Boolean isOn) {
        bulbView.setIsOn(isOn);
    }

    @NonNull
    @Override
    protected BulbView createViewInstance(@NonNull ThemedReactContext reactContext) {
        return new BulbView(reactContext);
    }

    public Map getExportedCustomBubblingEventTypeConstants() {
        return MapBuilder.builder()
                .put(
                        "statusChange",
                        MapBuilder.of(
                                "phasedRegistrationNames",
                                MapBuilder.of("bubbled", "onStatusChanged")))
                .build();
    }
}