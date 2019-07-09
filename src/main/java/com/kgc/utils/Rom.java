package com.kgc.utils;

public class Rom {
    //Runtime类可监控java的内存情况
    public static void main(String[] args) {
        //创建Rutime对象
        Runtime runtime=Runtime.getRuntime();
        //获得jvm分配给程序的内存数量
        long l = runtime.totalMemory();
        long l1 = runtime.freeMemory();
        long l2 = runtime.maxMemory();
        System.out.println("最大内存:"+l2);
        System.out.println("剩余内存:"+l1);
        System.out.println("程序总内存:"+l);

    }

}
