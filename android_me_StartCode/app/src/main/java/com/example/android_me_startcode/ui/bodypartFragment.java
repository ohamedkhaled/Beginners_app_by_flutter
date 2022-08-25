package com.example.android_me_startcode.ui;


import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

import androidx.fragment.app.Fragment;

import com.example.android_me_startcode.R;
import com.example.android_me_startcode.data.androidimageAsset;

public class bodypartFragment  extends Fragment {


    public bodypartFragment(){}

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Build build){

          View rootView =inflater.inflate(R.layout.body_fragment,container,false);

          ImageView imageView =(ImageView) rootView.findViewById(R.id.body_part);

          imageView.setImageResource(androidimageAsset.getHeads().get(0));

          return rootView ;
    }
}
