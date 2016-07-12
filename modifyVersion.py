# coding=utf-8
import os
import codecs
import re

# 以下三个变量需要修改
targetDir = "/Users/ericwang/Documents/workspace/xinzhu-client/"
version = '1.6.0'
version_code = '160'


targetVersion = 'versionName="' + version + '"'
targetCode = 'versionCode="' + version_code + '"'


def modifyInAndroid(dir):
    dir += '/AndroidManifest.xml'
    num = 0
    if os.path.isfile(dir):
        # read
        fpread = codecs.open(dir, 'r', 'utf-8')
        lines = fpread.readlines()
        fpread.close()
        # write
        fpwrite = codecs.open(dir, 'w', 'utf-8')
        patternCode = 'versionCode="\d+"'
        patternName = 'versionName="\d.\d.\d"'
        for line in lines:
            temp = line
            # version_code
            m_code = re.search(patternCode, line)
            if m_code:
                line = re.sub(patternCode, targetCode, line)
            # version_name
            m_name = re.search(patternName, line)
            if m_name:
                line = re.sub(patternName, targetVersion, line)
            fpwrite.write(line)
            if temp != line:
                print(dir + " is modified.")
                num += 1
        fpwrite.close()
    return num


def modifyInIos(dir):
    dir += '/Info.plist'
    num = 0
    if os.path.isfile(dir):
        fpread = codecs.open(dir, 'r', 'utf-8')
        lines = fpread.readlines()
        fpread.close()
        
        fpwrite = codecs.open(dir, 'w', 'utf-8')
        pattern = '<string>\d.\d.\d</string>'
        modify = False
        for line in lines:
            # version
            temp = line
            m_version = re.search(pattern, line)
            if m_version:
                line = re.sub(pattern, '<string>' + version + '</string>', line)
                if  temp != line:
                    modify = True
            fpwrite.write(line)
        if modify == True:
                print(dir, "is modified.")
                num += 1
        fpwrite.close()
        return num


def resolveAndroid():
    num = 0
    for filename in os.listdir(targetDir):
        pattern = "proj.android"
        result = re.match(pattern, filename)
        if result:
            num += modifyInAndroid(targetDir+result.string)
    print("共有" + str(num) + "个Android渠道修改")


def exclude(filename):
    exclude_channels = [
                        'ios_AppStore',
                        'ios_YD',
                        'ios_YD_SG',
                        'ios_YD_THIRD',
                        'ios_ST',
                        ]
    isIn = False
    for channel in exclude_channels:
        if channel == filename:
            isIn = True
            break
    return isIn


def  resolveIos():
    num = 0

    num += modifyInIos(targetDir + '/proj.ios_mac/ios/' + 'default')

    for filename in os.listdir(targetDir + '/proj.ios_mac/ios/'):
        if exclude(filename):
            continue
        else:
            pattern = "ios_"
            result = re.match(pattern, filename)
            if result:
                num += modifyInIos(targetDir + '/proj.ios_mac/ios/' + filename)
    print("共有" + str(num) + "个IOS渠道修改")
resolveAndroid()
resolveIos()
