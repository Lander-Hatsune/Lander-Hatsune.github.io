---
title: Manjaro安装
layout: post
categories: Assistant-skills
tags:
  - Manjaro
permalink: /manjaro-install
---
<!-- more -->

### 选择Manjaro
去年高中毕业时曾使用过Ubuntu，憾由于学习能力不佳，未能灵活使用，开学后再未启动过。但私以为自己具备了一定的Linux基础，再次尝试Linux，希望选择一个更customizable的、有一定挑战性的发行版。

我崇尚GNU的精神，但因其发行版缺少中文社区、中国用户，担心遇到问题，其时对它们只能望洋兴叹。

另一方面，我渴望Arch Linux的简洁、自由、文档完善，但惧于其对使用者的高要求以及“滚挂”的风险，一番了解后还是选择了Arch的衍生版本Manjaro。一方面，据称Manjaro保持了Arch的特性，同时稳定且具备了一部分图形界面，用户友好；另一方面，在*nix发行版信息聚合网站[DistroWatch](https://distrowatch.com/)上，其时Manjaro的受关注度居高不下，给了我一定的吸引力。

### 选择Gnome
Manjaro官方支持Gnome、KDE、xfce三种**桌面系统**，一番了解后，发现许多前辈对Gnome和KDE评价基本相当且良好，而对xfce的评价褒贬不一，像是复杂而细致的桌面管理方式，。我对外观并没有原则性的要求，不需要xfce那样高客制化，而前两者中，仅仅是由于对GNU的好感而选择了Gnome。

### 安装
在原系统的磁盘管理中确定磁盘的分区格式（GPT或MBR），并为Manjaro划定分区（windows磁盘管理显示为未分区）。

**如使用SATA接口的硬盘，应在BIOS中将SATA的模式调整为AHCI，否则Manjaro将无法识别**，如AHCI模式下windows不能正常使用，可在设备管理器中为SATA/NVMe管理添加驱动。

下载官网的Manjaro Gnome 64位镜像，Win10下用官方推荐的Rufus进行启动盘制作。选择对应磁盘的分区格式（GPT或MBR），听闻使用DD模式写入更稳妥，我似乎维持了默认ISO模式，也未出差错。

U盘启动Manjaro Linux Live，此时便可在U盘中使用系统。进一步的，进行本地硬盘的安装，过程中对于驱动可选做non-free，安装中便会自动安装对应的硬件驱动。

安装结束。


