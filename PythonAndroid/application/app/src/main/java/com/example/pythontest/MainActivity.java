package com.example.pythontest;

import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Button useNdk;
    private TextView resultText;

    static {
        System.loadLibrary("locale");
        System.loadLibrary("python3.5");
        System.loadLibrary("main");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        useNdk = Button.class.cast(findViewById(R.id.ndk_Btn));
        resultText = TextView.class.cast(findViewById(R.id.result_textview));

        //copy test.py sdcard
        initTestScript();
        initPythonLibrary();

        useNdk.setOnClickListener(this);

    }

    private void initPythonLibrary() {
        File file = new File("/data/data/com.example.pythontest/files/python3.5.zip");
        if (file.exists()) return;
        Toast.makeText(this,"copy python library",Toast.LENGTH_LONG).show();
        useNdk.setVisibility(View.GONE);
        new Thread(new Runnable() {
            @Override
            public void run() {

                //copy to sdcard
                try {
                    InputStream is = getAssets().open("python3.5.zip");
                    FileOutputStream fos = new FileOutputStream("/data/data/com.example.pythontest/files/python3.5.zip");
                    byte[] buffer = new byte[4 * 1024];
                    int length;
                    while ((length = is.read(buffer)) != -1) {
                        fos.write(buffer, 0, length);
                    }
                    fos.close();
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(MainActivity.this,"finished!",Toast.LENGTH_LONG).show();
                        useNdk.setVisibility(View.VISIBLE);
                    }
                });
            }
        }).start();

    }

    @Override
    public void onClick(View v) {
        resultText.setText("" + add(23, 45));
    }


    private void initTestScript() {
        //test file exist
        File file = new File("/data/data/com.example.pythontest/files/pythonforandroid.py");
        if (file.exists()) return;
        //copy to sdcard
        try {
            InputStream is = getAssets().open("pythonforandroid.py");
            FileOutputStream fos = new FileOutputStream("/data/data/com.example.pythontest/files/pythonforandroid.py");
            byte[] buffer = new byte[4 * 1024];
            int length;
            while ((length = is.read(buffer)) != -1) {
                fos.write(buffer, 0, length);
            }
            fos.close();
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    public static native int add(int first, int second);
}
