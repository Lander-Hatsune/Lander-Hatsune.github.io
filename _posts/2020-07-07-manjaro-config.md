---
title: Manjaro 配置
layout: post
categories: Assistant-skills
tags: 
  - Manjaro
  - Configuration
permalink: /manjaro-config
---
<!-- more -->

> 2020-01-20 Update.

### 软件源 ###

列出镜像源排名：

``` shell
sudo pacman-mirrors -i -c China -m rank
```

选择一个国内源。

刷新软件列表：

``` shell
sudo pacman -Syyu
```

OR, 修改`/etc/pacman.conf`（管理员），末尾添加所选的对应源。

``` text
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

安装`archlinuxcn-keyring`包导入GPG key，用以下载软件：

``` shell
sudo pacman -Sy archlinuxcn-keyring
```

### 安装软件 ###

#### Manjaro - 添加/删除软件（GUI前端） ####

在首选项中修改软件源、添加AUR（Arch User Repository）支持。

#### [Pacman-(Package manager utility)包管理器](https://lander-hatsune.github.io/pacman) ####

#### 常用软件 ####

1. 基本依赖

    ``` shell
    sudo pacman -S base-devel --needed
    ```

2. yay: Yet another Yogurt.

2. 输入法

    安装搜狗输入法时经常出错，无法正常使用，故放弃安装，转而使用自带的汉语输入法。
   
    ``` shell
    sudo pacman -S fcitx
    ```
   
    修改`~/.xprofile`，添加

    ```
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS="@im=fcitx"
    ```
    
    在`fcitx配置`中进行选择与配置。
    
3. 声卡驱动

    本次安装，alsa无论如何都未能识别声卡，最终将内核从原来的`Linux 5.6.16-1`切换至一个推荐的LTS版本`Linux 5.4.44-1`，问题迎刃而解。
    
    [之前盲目找到的一系列解决方案](https://askubuntu.com/questions/57810/how-to-fix-no-soundcards-found)
    
4. [**Emacs**](https://lander-hatsune.github.io/emacs-config)

5. zsh & Oh My Zsh

    当前安装的shells：

    ``` shell
    cat /etc/shells
    ```
    
    切换至zsh：

    ``` shell
    chsh -s /bin/zsh
    ```
    
    安装Oh My Zsh: (新Manjaro自带的提示功能高亮功能已经很不错了)

    ``` shell
    # curl:
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # wget:
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    ```
    
    如报错`Failed to connect`, [可使用国内源](https://blog.csdn.net/qq_35104586/article/details/103604964)
    
    ``` shell
    # curl
    sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
    # wget
    sh -c "$(wget -O- https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
    ```
    
    Theme: [PowerLevel10k](https://github.com/romkatv/powerlevel10k)
    
6. 其他

   - google-chrome: web browser.
   - typora: markdwon viewer.
   - mpv: media player.
   - linuxqq: QQ without wine.
   - wechat-uos: WeChat without wine.
   - ipython: better python terminal interpreter.
   - v2ray & qv2ray: ladders.
   - [texlive](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet/): $\LaTeX$. [ref](https://tuna.moe/assets/slides/latex-talk-v2.0.pdf).
   - [autojump](https://github.com/wting/autojump): quickly jumping in commandline. **Pay attention to post-install messages!**
   - [autotrash](https://github.com/bneijt/autotrash): automatically clear outdated trash in the trashbin.
     - Refer to the github main page to auto run.
    
### 字体 ###

- 从Windows`\`拷贝至`/usr/share/fonts`.
- [Ubuntu Mono](https://fonts.google.com/specimen/Ubuntu+Mono): 喜欢的等宽字体.

### 显卡开关 ###

完全参考[官方介绍](https://archived.forum.manjaro.org/t/guide-install-and-configure-optimus-manager-for-hybrid-gpu-setups-intel-nvidia/92196), 利用optimus-manager & optimus-manager-qt管理.

简略地, 对于Gnome, 步骤如下:

1. `sudo pacman -S optimus-manager`, `yay -S optimus-manager-qt`安装两个软件.
2. `sudo systemctl disable bumblebeed.service`禁用可能有的Bumblebee.
3. 将`/etc/X11/`及`/etc/X11/xorg.conf.d/`下与图形显示相关的`*.conf`禁用(添加后缀`.bak`).
   如`xx-mhwd.conf`.
4. `yay -S gdm-prime`, 移除`gdm`, `sudo systemctl enable gdm`启用, reboot.
5. 启动`optimus-manager`, 多试几次... 至少能通过reboot切换吧...

### 键位调整 ###

在`Manjaro-优化`中进行

- Left Windows -> Super
- Left Control -> Hyper
- Caps Lock -> Left Control

### 英文书签 ###

在`~/user-dirs.dirs`修改, 后将各文件夹重命名即可.

``` text
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Download"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/PublicShare"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"
```

### 外观 ###

在`Manjaro-优化`中进行
![](/figures/manjaro-config-appearance.png)

### 壁纸 ###

几个好用的网站

[WALLPAPER ABYSS](https://wall.alphacoders.com/)
[Unsplash](https://unsplash.com/)

当前壁纸

![](/figures/manjaro-config-wallpaper.png)

（我知道我知道Manjaro is not Arch.这不碍着壁纸好看啊)

### 注意备份! ###

- Deja Dup

### 参考 ###
- [manjaro双系统安装（折腾）教程](https://www.cnblogs.com/HGNET/p/12712977.html)
- [Oh My Zsh](https://ohmyz.sh/)
    
