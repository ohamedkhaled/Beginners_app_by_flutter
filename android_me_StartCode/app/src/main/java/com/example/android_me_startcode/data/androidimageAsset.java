package com.example.android_me_startcode.data;

import com.example.android_me_startcode.R;

import java.util.ArrayList;
import java.util.List;

public class androidimageAsset {

    private static final  List<Integer> heads =new ArrayList<Integer>()
    {{
       add(R.drawable.head1);
       add(R.drawable.head2);
    }};

    private static final  List<Integer> bodys =new ArrayList<Integer>()
    {{
        add(R.drawable.body1);
        add(R.drawable.body2);
        add(R.drawable.body3);
        add(R.drawable.body4);
    }};
    private static final  List<Integer> legs =new ArrayList<Integer>()
    {{
        add(R.drawable.leg1);
        add(R.drawable.leg2);
    }};

    private static final List<Integer> All =new ArrayList<Integer>(){{
        addAll(heads);
        addAll(legs);
        addAll(bodys);
    }};


    public static List<Integer> getHeads(){ return heads ; }
    public static List<Integer> getBodys(){ return bodys ; }
    public static List<Integer> getLegs(){ return legs ; }
    public static List<Integer> getAll(){ return All ; }


}
