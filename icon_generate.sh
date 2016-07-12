#!/bin/sh

# 要替换icon资源
sourcePath="$HOME/Desktop/source"
# 要替换的Android icon资源
sourcePathAndroid="$HOME/Desktop/source/android"
# 要替换的IOS icon资源
sourcePathIOS="$HOME/Desktop/source/ios"
# Android target path
androidTargetPath="$HOME/Documents/workspace/xinzhu-client"
# ios target path
iosTargetPath="$HOME/Documents/workspace/xinzhu-client/proj.ios_mac/ios/"
# 临时目录
temp="$HOME/Desktop/temp"


targetPath=""

if [[ ! -d "$temp" ]]; then
	mkdir "$temp"
fi

androidNameWithTag=(anzhi appchina baidu dangle lenovo mumayi uc tencent)
androidNameNoTag=(37 huawei jingling kupai linyou muzhiwan oppo vivo wdj xiaomi youku 360 sanxing am)
iosNameWithTag=(91 I4 iPG PP TBT XY CHACHA HM)
iosNameNoTag=(itools KuaiYong LE8)

# for name in ${androidNameWithTag[@]}; do
# 	path="$androidTargetPath/proj.android.$name"
# 	echo $path
# 	if [[  -d  "$path" ]]; then
# 		echo "$path 存在"
# 	fi
# done

# 创建source文件夹
# for sourceName in ${androidNameWithTag[@]}; do
# 	path="$sourcePathAndroid/$sourceName"
# 	if [[ ! -d $path ]]; then
# 		mkdir $path
# 		echo "$path 已创建"
# 	fi
# done
# for sourceName in ${androidNameNoTag[@]}; do
# 	path="$sourcePathAndroid/$sourceName"
# 	if [[ ! -d $path ]]; then
# 		mkdir $path
# 		echo "$path 已创建"
# 	fi
# done

path="$sourcePath/am/icon.png"

if [[ -f $path ]]; then
	echo "图片已存在"
fi

functionAndroid()
{
	# 有角标的渠道icon替换
	for name in ${androidNameWithTag[@]}
	do
		for sourceName in $sourcePathAndroid/*; do
			# echo "name: $sourcePath/$name"
			# echo "sourceName: $sourceName"
			if [[ $sourcePathAndroid/$name = $sourceName ]]; then
				# 把512的图片复制到temp
				path="$sourcePathAndroid/$name/icon.png"
				cp -f $path  $temp
				if [[ -f "$temp/icon.png" ]]; then
					echo "$sourceName 图片资源已经拷贝到temp"
					functionAndroidReplace
					# 资源替换完成删除图片
					if [[ -f "$temp/icon.png" ]]; then
						rm -f $temp/icon.png
						echo "-------------------$name ICON已替换完成, 已删除$name 渠道的资源文件-------------------"
					fi
				else
					echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$name 渠道的资源文件没有找到, 已跳过!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
				fi
				break
			else
				continue
			fi
		done
	done
	# 无角标的渠道替换
	for name in ${androidNameNoTag[@]}; 
	do
		if [[ -f "$sourcePathAndroid/normal/icon.png" ]]; then
			path="$sourcePathAndroid/normal/icon.png"
			cp -f $path $temp
			if [[ -f "$temp/icon.png" ]]; then
				functionAndroidReplace
				# 资源替换完成删除图片
				if [[ -f "$temp/icon.png" ]]; then
					rm -f $temp/icon.png
					echo "-------------------$name ICON已替换完成, 已删除$name 渠道的资源文件-------------------"
				fi
			fi
		else
			echo "没有找到无角标的资源, 已跳过无角标的ICON替换"
			break
		fi
	done
}

functionIOS()
{
	# ios有角标的替换
	for name in ${iosNameWithTag[@]}; 
	do
		for sourceName in $sourcePathIOS/*; do
			if [[ $sourcePathIOS/$name = $sourceName ]]; then
				path="$sourcePathIOS/$name/icon.png"
				cp -f $path $temp
				if [[ -f "$temp/icon.png" ]]; then
					echo "$sourceName 图片资源已经拷贝到temp"
					functionIOSReplace
					# 资源替换完成删除图片
					if [[ -f "$temp/Icon-29.png" ]]; then
						rm -f $temp/Icon-29.png
						echo "-------------------$name ICON已替换完成, 已删除$name 渠道的资源文件-------------------"
					fi
				else
					echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$name 渠道的资源文件没有找到, 已跳过!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
				fi
				break
			else
				continue
			fi
		done
	done
	# ios无角标的替换
	for name in ${iosNameNoTag[@]}; 
	do
		if [[ -f "$sourcePathIOS/normal/icon.png" ]]; then
			path="$sourcePathIOS/normal/icon.png"
			cp -f $path $temp
			if [[ -f "$temp/icon.png" ]]; then
				functionIOSReplace
				# 资源替换完成删除图片
				if [[ -f "$temp/Icon-29.png" ]]; then
					rm -f $temp/Icon-29.png
					echo "-------------------$name ICON已替换完成, 已删除$name 渠道的资源文件-------------------"
				fi
			fi
		else
			echo "没有找到无角标的资源, 已跳过无角标的ICON替换"
			break
		fi
	done
}

functionAndroidReplace()
{
	path="$androidTargetPath/proj.android.$name"

	# drawable-xxxhdpi
	if [[  -d "$path/res/drawable-xxxhdpi" ]]; then
		sips -Z 152 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-xxxhdpi/
		echo "$name 的drawable-xxxhdpi已替换"
	fi
	# drawable-hdpi-1208x720 huawei渠道特有
	if [[  -d "$path/res/drawable-hdpi-1208x720" ]]; then
		sips -Z 144 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-hdpi-1208x720/
		echo "$name 的drawable-hdpi-1208x720已替换"
	fi
	# drawable-zh-hdpi-1208x720 huawei渠道特有
	if [[  -d "$path/res/drawable-zh-hdpi-1208x720" ]]; then
		sips -Z 144 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-zh-hdpi-1208x720/
		echo "$name 的drawable-zh-hdpi-1208x720已替换"
	fi
	# drawable-xxhdpi
	if [[  -d "$path/res/drawable-xxhdpi" ]]; then
		sips -Z 144 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-xxhdpi/
		echo "$name 的drawable-xxhdpi已替换"
	fi
	# drawable-zh-xxhdpi huawei渠道特有
	if [[  -d "$path/res/drawable-zh-xxhdpi" ]]; then
		sips -Z 144 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-zh-xxhdpi/
		echo "$name 的drawable-zh-xxhdpi已替换"
	fi
	# drawable-sw360dp-xxhdpi vivo渠道特有
	if [[  -d "$path/res/drawable-sw360dp-xxhdpi" ]]; then
		sips -Z 144 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-sw360dp-xxhdpi/
		echo "$name 的drawable-sw360dp-xxhdpi已替换"
	fi
	# drawable-xhdpi
	if [[  -d "$path/res/drawable-xhdpi" ]]; then
		sips -Z 128 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-xhdpi/
		echo "$name 的drawable-xhdpi已替换"
	fi
	# drawable-zh-xhdpi huawei渠道特有
	if [[  -d "$path/res/drawable-zh-xhdpi" ]]; then
		sips -Z 128 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-zh-xhdpi/
		echo "$name 的drawable-zh-xhdpi已替换"
	fi
	# drawable-sw360dp-xhdpi vivo渠道特有
	if [[  -d "$path/res/drawable-sw360dp-xhdpi" ]]; then
		sips -Z 128 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-sw360dp-xhdpi/
		echo "$name 的drawable-sw360dp-xhdpi已替换"
	fi

	# drawable-hdpi
	if [[  -d "$path/res/drawable-hdpi" ]]; then
		sips -Z 96 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-hdpi/
		echo "$name 的drawable-hdpi已替换"
	fi
	# drawable-zh-hdpi huawei渠道特有
	if [[  -d "$path/res/drawable-zh-hdpi" ]]; then
		sips -Z 96 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-zh-hdpi/
		echo "$name 的drawable-zh-hdpi已替换"
	fi
	# drawable-sw360dp-hdpi vivo渠道特有
	if [[  -d "$path/res/drawable-sw360dp-hdpi" ]]; then
		sips -Z 96 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-sw360dp-hdpi/
		echo "$name 的drawable-sw360dp-hdpi已替换"
	fi
	# drawable-mdpi
	if [[  -d "$path/res/drawable-mdpi" ]]; then
		sips -Z 72 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-mdpi/
		echo "$name 的drawable-mhdpi已替换"
	fi
	# drawable-ldpi
	if [[  -d "$path/res/drawable-ldpi" ]]; then
		sips -Z 48 $temp/icon.png
		cp -f $temp/icon.png $path/res/drawable-ldpi/
		echo "$name 的drawable-ldpi已替换"
	fi
}
iconSize=(152 144 120 114 100 80 76 72 58 57 50 40 29)
functionIOSReplace()
{
	path="$iosTargetPath/ios_$name"
	local lastName="icon.png"
	# 替换iTunesArtwork文件
	cp $temp/$lastName  $path/
	if [[ -f "$path/$lastName" ]]; then
		mv $path/$lastName $path/iTunesArtwork
		echo "$name 的iTunesArtwork已替换"
	fi
	for size in ${iconSize[@]}; do
		# 压缩尺寸
		sips -Z $size $temp/$lastName
		# 重命名文件
		mv $temp/$lastName $temp/Icon-$size.png
		lastName="Icon-$size.png"
		# 复制到指定目录
		if [[ -f "$temp/$lastName" ]]; then
			cp -f $temp/$lastName $path/
			echo "$name 的尺寸$size 的Icon已替换"
		else
			echo "$name 的尺寸$size 的Icon替换失败"
			break
		fi
		
	done
}

functionAndroid
functionIOS

# 替换完成删除temp目录
rm -fr $temp