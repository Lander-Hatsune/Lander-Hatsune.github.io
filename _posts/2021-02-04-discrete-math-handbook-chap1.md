---
title: 离散数学 第一章 学习手册 v1.0
layout: post
categories: Documents
tag: 
    - Tsinghua
    - DiscreteMath
    - Manual
permalink: /DM-handbook
---
<!-- more -->
# Table of Contents

-   [概念](#org624ef34)
    -   [例 1.1.1: 边可以表示某种关系](#org91da3ad)
    -   [例 1.1.2: 边也可以承载距离](#org4f6b32b)
    -   [例 1.1.3\*: 利用图论建模解决问题](#org8f1dd73)
    -   [图的定义](#org7c67d2d)
    -   [分类及相关定义](#orge41c586)
        -   [边与结点](#org14f4941)
        -   [图](#org99cedb9)
    -   [度](#org14fb703)
    -   [子图](#orgb8debb7)
        -   [平凡子图](#org170e892)
-   [性质](#org97191a3)
-   [运算](#org1eeb2a3)
    -   [交](#orgac6d4cd)
    -   [并](#orgd9b7679)
    -   [对称差](#org593a196)
    -   [差, 补](#org737b0d0)
-   [同构](#org42265c9)
    -   [定义](#org2f3327b)
    -   [性质](#orgbe20fb5)



<a id="org624ef34"></a>

# 概念

用 **结点** 表示 **事物**, 用 **边** 表示它们之间的 **联系**.


<a id="org91da3ad"></a>

## 例 1.1.1: 边可以表示某种关系

用结点表示A, B, C, D四组队伍, 用边表示比赛获胜关系, 则下图可表示:
A胜B, C, D, B胜C, D胜C, 而B, D间未比赛.

<img style="margin: auto;" src="/figures/discrete-math/1.1.1.svg"> 
<p class="text-center"> 图 1.1.1 表示关系的边</p>


<a id="org4f6b32b"></a>

## 例 1.1.2: 边也可以承载距离

用结点表示A, B, C, D四个城市, 用边表示两两间的道路距离(以 `km` 为单位):

<img style="margin: auto;" src="/figures/discrete-math/1.1.2.svg"> 
<p class="text-center"> 图 1.1.2 表示距离的边</p>


<a id="org8f1dd73"></a>

## 例 1.1.3\*: 利用图论建模解决问题

6个人中如果没有3个人互相认识, 则至少有3个人相互不认识.

**证明**: 

-   用6个结点表示6个人, 用蓝色边表示两人认识, 用黑色边表示两人不认识.
-   问题转化为证明图中存在黑色三角形或存在蓝色三角形.
-   考察A, 与A相连的五条边中, **必然存在3条黑色边或存在3条蓝色边**.
-   若存在三条蓝色边, 连向B, C, E, 如图.
    
    <img style="margin: auto;" src="/figures/discrete-math/1.1.3.svg"> 
    <p class="text-center"> 图 1.1.3 图论建模</p>
    
    则若B, C, E间存在一条蓝色边, 就与A构成 **蓝色三角形**, 若B, C, E间不存在蓝色边, 就构成 **黑色三角形**.
-   若存在三条黑色边, 类似可证.


<a id="org7c67d2d"></a>

## 图的定义

-   结点集和边集的二元组称为图, 记作 $G = (V(G), E(G)) = (V, E)$.
-   结点集 $V(G)$ 是 **非空集合**. $E(G)$ 为边集.
    -   **注意**: **结点集是非空的**, 我们将 **边集为空集** 的图定义为空图.
-   $V = \{v_1, v_2, \cdots, v_n\}, E = \{e_1, e_2, \cdots, e_n\}$.
-   $ \lvert V \lvert  = n$ 称为图 $G$ 的 **阶**.


<a id="orge41c586"></a>

## 分类及相关定义


<a id="org14f4941"></a>

### 边与结点

边 $e_k = \langle v_i, v_j \rangle$.

-   称 $v_i$ 与 $v_j$ 为 **相邻结点**.
-   称 $e_k$ 分别与 $v_i, v_j$ **相关联**.

-   **孤立点:** 结点 $v$ 没有与之相关联的边.
    
    <img style="margin: auto;" src="/figures/discrete-math/1.1.8.svg"> 
    <p class="text-center"> 图 1.1.8 孤立点</p>

-   **邻点集 $\Gamma(v)$:** 与结点 $v$ 具有一定关系的相邻结点的集合.
    -   对无向图, $\Gamma(v) = \{u  \lvert  \langle u, v \rangle \in E\}$.
    -   对有向图
        
        -   直接后继集(外邻集) $\Gamma^+(v) = \{u  \lvert  \langle v, u \rangle \in E\}$,
        -   直接前趋集(内邻集) $\Gamma^-(v) = \{u  \lvert  \langle u, v \rangle \in E\}$.
        
    <img style="margin: auto;" src="/figures/discrete-math/1.1.9.svg">
    <p class="text-center"> 图 1.1.9 前趋集与后继集</p>

-   **有向边:** 具有方向, 用箭头表示. 有向边也可称为 **弧**.
    
    -   $v_i$ 是 $e_k$ 的 **始点**, $v_j$ 是 **终点**.
    -   $v_i$ 是 $v_j$ 的 **直接前趋**, $v_j$ 是 $v_i$ 的 **直接后继**.
    
    <img style="margin: auto;" src="/figures/discrete-math/1.1.5.svg"> 
    <p class="text-center"> 图 1.1.5 有向边</p>

-   **无向边:** 没有方向, 简单的实线.
    
    -   $v_i$ 和 $v_j$ 是 $e_k$ 的两个 **端点**.
    
    <img style="margin: auto;" src="/figures/discrete-math/1.1.6.svg"> 
    <p class="text-center"> 图 1.1.6 无向边</p>

-   **重边:** 同一对结点间存在的多条边.
    -   对于有向边, 还要求方向相同.
    -   如: 下图 $e_1, e_{1'}$.

-   **自环:** 只与一个结点关联.
    -   如: 下图 $e_2, e_3$.

<img style="margin: auto;" src="/figures/discrete-math/1.1.4.svg"> 
<p class="text-center"> 图 1.1.4 重边与自环</p>


<a id="org99cedb9"></a>

### 图

-   **多重图:** **含有** 重边.

---

-   **简单图:** **不存在重边, 不存在自环** 的 **无向图**.
-   **空图:** **没有任何边** 的(简单)图. 用 $N_n$ 表示.
    -   **等价** 于 $ \lvert E \lvert  = 0$.
    -   等价于 每个结点都是孤立点.
-   **完全图:** **任意** 两结点间都有边的 **简单图**. 用 $K_n$ 表示.

<img style="margin: auto;" src="/figures/discrete-math/1.1.7.svg"> 
<p class="text-center"> 图 1.1.7 简单图, 空图, 完全图</p>

---

-   **有向图:** **全部** 由有向边构成.
-   **无向图:** **全部** 由无向边构成.
-   **混合图:** 两种边兼有.

---

-   **有限图:** $V$ 和 $E$ **均为** 有限集.
-   **无限图:** 不予讨论.

---

-   **赋权图:** **每条边** 都具有实数权值, 常记作 $w$.
    -   **正权图:** **每条边** 权值均为正.

<img style="margin: auto;" src="/figures/discrete-math/1.1.2.svg"> 
<p class="text-center"> 图 1.1.2 正权图一例</p>


<a id="org14fb703"></a>

## 度

-   图 $G$ 中, 某结点 $v$ 所关联的边数称该结点的 **度**, 记作 $d(v)$.
-   若 $v$ 带有自环, 则自环对 $d(v)$ 的贡献为 **2**.
    
    <img style="margin: auto;" src="/figures/discrete-math/1.1.4.svg"> 
    <p class="text-center"> 图1.1.4 度</p>
    
    如上图, $d(v_2) = 5$.

-   对有向图, 还可定义:
    -   **正度(出度) $d^+(v)$:** 以 $v$ 为始点的边的数目.
        -   亦即直接后继集的基数.
    -   **负度(入度) $d^-(v)$:** 以 $v$ 为终点的边的数目.
        -   亦即直接前趋集的基数.
    -   $d^+(v) + d^-(v) = d(v)$.

-   **完全图** $K_n$ 中每个结点的度都是 $(n - 1)$.


<a id="orgb8debb7"></a>

## 子图

设 $G = (V, E)$, 取 $V' \subseteq V, E' \subseteq E$

构成 $G'$, 称其为 $G$ 的子图.

<img style="margin: auto;" src="/figures/discrete-math/1.1.10.svg"> 
<p class="text-center"> 图 1.1.10 子图</p>

-   **支撑子图(生成子图):** 若 $V = V'$, 即结点取全.
-   **导出子图:** 若 $E'$ 包含(等于) $G$ 中所有与 $V'$ 关联的边.


<a id="org170e892"></a>

### 平凡子图

有下列两种情况:

-   $G$ 本身. 
    -   它是自己的子图, 且既是支撑子图, 也是导出子图.
-   $G$ 的空支撑子图.


<a id="org97191a3"></a>

# 性质

-   若 $G$ 有 $m$ 条边, 则其结点度数和为 $2m$
    
    无论有向无向, 每条边对度数和贡献为2.

-   度数为奇数的结点有偶数个
    
    结点总度数和为偶数.

-   有向图中, 结点正度和等于负度和
-   完全图 $K_n$ 的边数为 $\cfrac 1 2 n (n - 1)$
    -   每个结点的度均为 $n - 1$.

-   非空简单图中一定存在度相同的结点
    
    > 鸽巢原理
    
    -   非孤立结点度取值范围 $1 \sim (n - 1)$, 必定有重复.
    -   若有孤立结点, 排除孤立结点, 剩余非孤立结点度取值必定有重复.
        -   若全为孤立结点, 则为空图.


<a id="org1eeb2a3"></a>

# 运算


<a id="orgac6d4cd"></a>

## 交

$$G_1 \cap G_2 = (V_1 \cap V_2, E_1 \cap E_2)$$


<a id="orgd9b7679"></a>

## 并

$$G_1 \cup G_2 = (V_1 \cup V_2, E_1 \cup E_2)$$


<a id="org593a196"></a>

## 对称差

$$G_1 \oplus G_2 = (V_1 \cup V_2, E_1 \oplus E_2)$$

-   注意 **结点集的运算为并**.


<a id="org737b0d0"></a>

## 差, 补

-   对于 $G$ 的子图 $H$, $G - H$ 指在 $G$ 中删去 $H$ 的各边.
-   对于简单图 $G$, 其补图为 $\overline G = K_n - G$.

-   除去某结点: $G - v$ 为 $G$ 的导出子图.
-   除去某边: $G - e$ 为 $G$ 的支撑(生成)子图.


<a id="org42265c9"></a>

# 同构

<img style="margin: auto;" src="/figures/discrete-math/1.1.11.svg"> 
<p class="text-center"> 图 1.1.11 同构</p>


<a id="org2f3327b"></a>

## 定义

两个图 $G_1 = (V_1, E_1), G_2 = (V_2, E_2)$, 
如果 $V_1$ 和 $V_2$ 之间存在双射 $f$, 
满足: $(u, v) \in E_1 \Leftrightarrow (f(u), f(v)) \in E_2$,
称 $G_1$ 与 $G_2$ 同构, 记作 $G_1 \cong G_2$

-   通过"拖拽"改变的形状.


<a id="orgbe20fb5"></a>

## 性质

同构的两图满足: 

-   两图结点数, 边数相同.
-   两图结点度的非增序列相同.
-   "存在同构的导出子图".
    -   **取一图的导出子图, 另一图必能取出与之同构的导出子图**.

