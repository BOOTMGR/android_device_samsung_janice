/*
 * Copyright (C) 2012 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import com.cyanogenmod.settings.device.R;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;

public class ScreenFragmentActivity extends PreferenceFragment {

	private static final String TAG = "GalaxySAdvance_Settings_Screen";

	private TouchscreenSensitivity mTouchscreenSensitivity;

	public static final String FILE_SWEEP2WAKE = "/sys/kernel/mxt224e/sweep2wake";
	public static final String FILE_FBDELAY = "/sys/module/fbearlysuspend/parameters/fbdelay";
	public static final String FILE_FBDELAY_MS = "/sys/module/fbearlysuspend/parameters/fbdelay_ms";

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		addPreferencesFromResource(R.xml.screen_preferences);
		// PreferenceScreen prefSet = getPreferenceScreen();

		mTouchscreenSensitivity = (TouchscreenSensitivity) findPreference(DeviceSettings.KEY_TOUCHSCREEN_SENSITIVITY);
		mTouchscreenSensitivity
				.setEnabled(TouchscreenSensitivity.isSupported());

	}

	@Override
	public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen,
			Preference preference) {

		String boxValue;
		String key = preference.getKey();

		Log.w(TAG, "key: " + key);

		if (key.equals(DeviceSettings.KEY_USE_SWEEP2WAKE)) {
			boxValue = (((CheckBoxPreference) preference).isChecked() ? "on"
					: "off");
			Utils.writeValue(FILE_SWEEP2WAKE, boxValue);
		} else if (key.equals(DeviceSettings.KEY_FBDELAY)) {
			Log.d("harsh_debug", "key :" + DeviceSettings.KEY_FBDELAY);
			boxValue = (((CheckBoxPreference) preference).isChecked() ? "1" : "0");
			Utils.writeValue(FILE_FBDELAY, boxValue);
			if (Integer.valueOf(boxValue) == 1)
				Utils.writeValue(FILE_FBDELAY_MS, "350");
		}

		return true;
	}

	public static void restore(Context context) {
		SharedPreferences sharedPrefs = PreferenceManager
				.getDefaultSharedPreferences(context);
		
		String value = sharedPrefs.getBoolean(
				DeviceSettings.KEY_USE_SWEEP2WAKE, false) ? "on" : "off";
		Utils.writeValue(FILE_SWEEP2WAKE, value);
		value = sharedPrefs.getBoolean(
				DeviceSettings.KEY_FBDELAY, false) ? "1" : "0";
		Utils.writeValue(FILE_FBDELAY, value);
		if (Integer.valueOf(value) == 1)
			Utils.writeValue(FILE_FBDELAY_MS, "350");
	}
}
