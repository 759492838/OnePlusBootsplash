mn=`cat $MODPATH/MRNY`
chmod -R 0777 $MODPATH/*
ui_print "




—— 刷入时间$(date '+%g-%m-%d %H:%M:%S')


—— 面具版本$MAGISK_VER_CODE


—— 面具代号$MAGISK_VER




"
sleep 1.111
ui_print "正在刷入开机动画"
sleep 1.111
ui_print "正在检测看见文件位置耐心等待"
if [[ ! -f "/system/media/bootanimation.zip" ]]; then
    sleep 1.111
    ui_print "没有检测到system目录的开机动画"
else
    sleep 1.111
    ui_print "已检测到system目录下的开机动画文件"
    sleep 1.111
    ui_print "正在写入配置文件…"
    cd $MODPATH
    mkdir tmp
    echo "1080 2400 32
p 0 0 part0
p 0 0 part1" > tmp/desc.txt
    #desc.txt的首行内容为横向长度 纵向长度 速度
    cp -rf part0 tmp/
    mv tmp/part0 tmp/part1
    #这里默认循环同一个画面，可以去掉复制部分变成直接移动
    mv part0 tmp/
    cd tmp
    $MODPATH/zip -0 Github_LIYU.zip part0/*
    $MODPATH/zip -u -0 Github_LIYU.zip part1/*
    $MODPATH/zip -u -0 Github_LIYU.zip *
    cd $MODPATH
    mv tmp/Github_LIYU.zip $MODPATH/
    echo "mount --bind $mn/Github_LIYU.zip /system/media/bootanimation.zip" >> post-fs-data.sh
    rm -rf $MODPATH/tmp
    echo "文件配置完毕，开启动画已经好了重启看看吧"
fi

if [[ ! -f "/product/media/bootanimation.zip" ]]; then
    sleep 1.111
    ui_print "没有检测到product目录的开机动画"
else
    sleep 1.111
    ui_print "已检测到product目录下的开机动画文件"
    sleep 1.111
    ui_print "正在写入配置文件…"
    cd $MODPATH
    mkdir tmp
    echo "1080 2400 32
p 0 0 part0
p 0 0 part1" > tmp/desc.txt
    #desc.txt的首行内容为横向长度 纵向长度 速度
    cp -rf part0 tmp/
    mv tmp/part0 tmp/part1
    #这里默认循环同一个画面，可以去掉复制部分变成直接移动
    mv part0 tmp/
    cd tmp
    $MODPATH/zip -0 Github_LIYU.zip part0/*
    $MODPATH/zip -u -0 Github_LIYU.zip part1/*
    $MODPATH/zip -u -0 Github_LIYU.zip *
    cd $MODPATH
    mv tmp/Github_LIYU.zip $MODPATH/
    echo "mount --bind $mn/Github_LIYU.zip /product/media/bootanimation.zip" >> post-fs-data.sh
    rm -rf $MODPATH/tmp
    echo "文件配置完毕，开启动画已经好了重启看看吧"
fi

if [[ ! -f "/my_product/media/bootanimation/bootanimation.zip" ]]; then
    sleep 1.111
    ui_print "没有检测到my_product目录的开机动画"
else
    sleep 1.111
    ui_print "已检测到my_product目录下的开机动画文件"
    sleep 1.111
    ui_print "正在写入配置文件…"
    cd $MODPATH
    mkdir tmp
    echo "g 1080 2400 0 0 32
p 0 0 part0
p 0 0 part1" > tmp/desc.txt
    #desc.txt的首行内容为横向长度 纵向长度 x/y坐标偏差 速度
    cp -rf part0 tmp/
    mv tmp/part0 tmp/part1
    #这里默认循环同一个画面，可以去掉复制部分变成直接移动
    mv part0 tmp/
    cd tmp
    $MODPATH/zip -0 Github_LIYU.zip part0/*
    $MODPATH/zip -u -0 Github_LIYU.zip part1/*
    $MODPATH/zip -u -0 Github_LIYU.zip *
    cd $MODPATH
    mv tmp/Github_LIYU.zip $MODPATH/
    echo "mount --bind $mn/Github_LIYU.zip /my_product/media/bootanimation/bootanimation.zip
mount --bind $mn/Github_LIYU.zip /my_product/media/bootanimation/rbootanimation.zip" >> post-fs-data.sh
    rm -rf $MODPATH/tmp
    echo "文件配置完毕，开启动画已经好了重启看看吧"
fi

echo "id=你的名字_开机动画
name=[OnePlus] 开机动画
version=离雨
versionCode=606
author=离雨
description=【开机动画模板，内置你的名字开机动画】，已适配system，product，my_product分区的开机动画  [刷入时间：$(date '+%g-%m-%d %H:%M:%S')]
" > module.prop
#这里是module.prop显示内容，一定要记得改！