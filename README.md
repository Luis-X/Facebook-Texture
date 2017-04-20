![AsyncDisplaykit2.0](http://upload-images.jianshu.io/upload_images/1519620-6b512789b569e61a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

# 前言

AsyncDisplayKit是一个建立在UIKit基础上的iOS框架，让即使是最复杂的用户界面光滑和响应。它最初建成Facebook的Paper应用，并与流行的[pop](https://github.com/facebook/pop)基于物理的动画相辅相成——它与UIKit动力学和传统应用程序的设计同样强大。最近，它是用于Pinterest应用的重写。


![AsyncDisplayKit](http://upload-images.jianshu.io/upload_images/1519620-0f2c1fb888b70c90.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


随着框架的发展，添加了许多功能，在现代iOS应用程序中通过消除常见的样板风格和结构可以节省开发人员大量的时间。如果你曾经处理过Cell重用的Bug，试图高性能预加载数据页面或滚动风格界面，甚至只是试图让你的应用从下降太多的帧可以受益于整合ASDK。

[官方地址](http://asyncdisplaykit.org/docs/getting-started.html)



# 目录

- Quickstart（快速学习）
- Layout Examples（布局示例）
- Layout Specs（布局规则）
- ASInsetLayoutSpec（插入布局规则）
- ASOverlayLayoutSpec（覆盖布局规则）
- ASBackgroundLayoutSpec（背景布局规则）
- ASCenterLayoutSpec（中心布局规则）
- ASRatioLayoutSpec（比例布局规则）
- ASRelativeLayoutSpec（相对布局规则）
- ASStackLayoutSpec（堆叠布局规则）
- ASAbsoluteLayoutSpec（绝对布局约束)
- ASLayoutSpec（布局规则）
- Layout Element Properties（布局元素属性）
- ASStackLayoutElement Properties（堆叠布局元素属性）
- ASAbsoluteLayoutElement Properties（绝对布局元素属性）
- ASLayoutElement Properties（布局元素属性）




# 章节


### 一、Quickstart（快速学习）

| 基本概念            | 英文            | 中文   |
| --------------- | ------------- | ---- |
| Layout Specs    | specification | 布局规则 |
| Layout Elements | Elements      | 布局元素 |

**1、LayoutSpecs（布局规则）**

```shell
LayoutSpecs是“layout specification”的缩写，没有物理存在。
相反，LayoutSpecs充当其他LayoutElements的容器，来理解这些子LayoutElements如何相互关联。
AsyncDisplayKit提供了ASLayoutSpec的几个子类。
从插入单个简单布局规则到更多更复杂的布局规则，变化堆放排列配置。
```

**2、LayoutElements（布局元素）**

```shell
LayoutSpecs包含并排列LayoutElements。
所有ASDisplayNodes和ASLayoutSpecs都符合<ASLayoutElement>协议。
这意味着您可以从Nodes和其他LayoutSpecs构成LayoutSpecs。
ASLayoutElement协议有几个属性，可用于创建非常复杂的LayoutSpecs。
此外LayoutSpecs也具有自己的一组属性，可用于调整LayoutElements的排列。
```

**3、组合LayoutSpecs和LayoutElements，创建复杂的UI**

```shell
可以看到如何将ASTextNode（黄色高亮），ASVideoNode（顶部图像）和ASStackLayoutSpec（“堆放布局规则”）组合来创建复杂布局。
```


![LayoutSpecs和LayoutElements](http://upload-images.jianshu.io/upload_images/1519620-50dba262eae593e2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


```shell
使用ASCenterLayoutSpec（“中心布局规则”）和ASOverlayLayoutSpec（“覆盖布局规则”），来放置顶部ASVideoNode（顶部图像）的播放按钮。
```


![LayoutSpecs和LayoutElements](http://upload-images.jianshu.io/upload_images/1519620-bc2736fc90d9432c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**4、一些Node需要固定大小**

```shell
#一些元素具有一个”固有大小“，基于他们可用内容。
例如，ASTextNode可以根据其属性字符串计算其大小，其他具有固有大小的Node包括：
ASImageNode
ASTextNode
ASButtonNode
ASTextNode
#所有其他Node在外部资源加载完成之前没有或者缺乏固有大小。
例如，在从URL下载图像之前，ASNetworkImageNode不知道它的大小。这些种类包括:
ASVideoNode
ASVideoPlayerNode
ASNetworkImageNode
ASEditableTextNode
#注意:
#缺少初始固有大小的这些Node必须设置它们的初始大小，使用ASRatioLayoutSpec（“比例布局规则”），ASAbsoluteLayoutSpec（“绝对布局规则”）或者对象的size属性。
```

**5、Layout调试**

```shell
#在任何ASDisplayNode或ASLayoutSpec上调用-asciiArtString，会返回对象及其子对象的字符图。
(可选）如果在任何Node或layoutSpec上设置.debugName，那么也将包含在字符图。
例如:
  -----------------------ASStackLayoutSpec----------------------
|  -----ASStackLayoutSpec-----  -----ASStackLayoutSpec-----  |
|  |       ASImageNode       |  |       ASImageNode       |  |
|  |       ASImageNode       |  |       ASImageNode       |  |
|  ---------------------------  ---------------------------  |
--------------------------------------------------------------
#可以在任何ASLayoutElement(node或layoutSpec)上打印对象样式，调整大小属性时极其方便。
例如:
(lldb) po _photoImageNode.style
Layout Size = min {414pt, 414pt} <= preferred {20%, 50%} <= max {414pt, 414pt}
```



### 二、Layout Examples（布局示例）

**1、Simple Header with Left and Right Justified Text（简单标题左右对齐）**


![layout-examples-1](http://upload-images.jianshu.io/upload_images/1519620-a3ace3851b14db03.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


[示例工程](https://github.com/facebook/AsyncDisplayKit/tree/master/examples/LayoutSpecExamples)

**创建布局：**

| 约束                | 说明     |
| ----------------- | ------ |
| ASStackLayoutSpec | 垂直的    |
| ASStackLayoutSpec | 水平的    |
| ASInsetLayoutSpec | 插入整个标题 |

布局的组成（layout specs + nodes），如图:

![layout-examples-2.png](http://upload-images.jianshu.io/upload_images/1519620-9f6d47a8ffeffc6c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**代码：**

```objective-c
//Objective-C
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
  
  // 当用户名和位置信息文本太长时,收缩堆放视图来适应屏幕,而不是将所有内容向右堆放
  ASStackLayoutSpec *nameLocationStack = [ASStackLayoutSpec verticalStackLayoutSpec];
  nameLocationStack.style.flexShrink = 1.0;
  nameLocationStack.style.flexGrow = 1.0;
  
  //如果从服务器获取位置信息,并检查位置信息是否可用
  if (_postLocationNode.attributedText) {
    nameLocationStack.children = @[_usernameNode, _postLocationNode];
  } else {
    nameLocationStack.children = @[_usernameNode];
  }
  
  //水平堆放
  ASStackLayoutSpec *headerStackSpec = [ASStackLayoutSpec   stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                     spacing:40     
              justifyContent:ASStackLayoutJustifyContentStart
                  alignItems:ASStackLayoutAlignItemsCenter
                    children:@[nameLocationStack, _postTimeNode]];
  
  //插入堆放
  return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 10, 0, 10)    
                                                child:headerStackSpec];
  
}
```

将示例项目从纵向旋转到横向，看看间隔体是如何增长和收缩的。



**2、Photo with Inset Text Overlay（图片上覆盖文本）**

![layout-examples-3.png](http://upload-images.jianshu.io/upload_images/1519620-e5f10ad4a06023b1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**创建布局：**

| 约束                  | 说明         |
| ------------------- | ---------- |
| ASInsetLayoutSpec   | 插入文本       |
| ASOverlayLayoutSpec | 插入文本覆盖在图片上 |

**代码：**

```objective-c
//Objective-C
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
  
  _photoNode.style.preferredSize = CGSizeMake(USER_IMAGE_HEIGHT*2, USER_IMAGE_HEIGHT*2);
  
  // INIFINITY(插入无边界)
  UIEdgeInsets insets = UIEdgeInsetsMake(INFINITY, 12, 12, 12);
  ASInsetLayoutSpec *textInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:insets child:_titleNode];
  
  return [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_photoNode 
                                                 overlay:textInsetSpec];
  
}
```



**3、Photo with Outset Icon Overlay（图片上覆盖和图标）**

![layout-examples-4.png](http://upload-images.jianshu.io/upload_images/1519620-869b843a8ba67b85.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**创建布局：**

| 约束                   | 说明        |
| -------------------- | --------- |
| ASAbsoluteLayoutSpec | 放置照片和icon |
| ASLayoutable属性       | 单独调整大小和位置 |

**代码：**

```objective-c
//Objective-C
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
  
  _iconNode.style.preferredSize = CGSizeMake(40, 40);
  _iconNode.style.layoutPosition = CGPointMake(150, 0);
  
  _photoNode.style.preferredSize = CGSizeMake(150, 150);
  _photoNode.style.layoutPosition = CGPointMake(40 / 2.0, 40 / 2.0);
  
  return [ASAbsoluteLayoutSpec absoluteLayoutSpecWithSizing:ASAbsoluteLayoutSpecSizingSizeToFit
                                                   children:@[_photoNode, _iconNode]];
  
}  
```



**4、Simple Inset Text Cell（简单插入文本单元格）**


![layout-examples-5](http://upload-images.jianshu.io/upload_images/1519620-d976d4eb6abbd31d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**创建布局：**

| 约束                 | 说明         |
| ------------------ | ---------- |
| ASInsetLayoutSpec  | 插入文本       |
| ASCenterLayoutSpec | 根据指定属性文本居中 |

**代码：**

```objective-c
//Objective-C
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{

    UIEdgeInsets insets = UIEdgeInsetsMake(0, 12, 4, 4);
    ASInsetLayoutSpec *inset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:insets
                                                                      child:_titleNode];

    return [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringY                                                  
    sizingOptions:ASCenterLayoutSpecSizingOptionMinimumX 
            child:inset];
            
}
```



**5、Top and Bottom Separator Lines（顶部和底部分隔线）**

![layout-examples-6.png](http://upload-images.jianshu.io/upload_images/1519620-c88a91c591bc220c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**创建布局：**

| 约束                | 说明           |
| ----------------- | ------------ |
| ASInsetLayoutSpec | 插入文本         |
| ASStackLayoutSpec | 垂直的堆放文本上下分割线 |

布局的组成（layout specs + nodes），如图：

![layout-examples-7.png](http://upload-images.jianshu.io/upload_images/1519620-3ca1456c05c2db84.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**代码：**

```objective-c
//Objective-C
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{

  _topSeparator.style.flexGrow = 1.0;
  _bottomSeparator.style.flexGrow = 1.0;

  ASInsetLayoutSpec *insetContentSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 20, 20, 20) child:_textNode];

  return [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                                 spacing:0
                                          justifyContent:ASStackLayoutJustifyContentCenter
                                              alignItems:ASStackLayoutAlignItemsStretch
                                                children:@[_topSeparator, insetContentSpec, _bottomSeparator]];
}
  
```



### 三、Layout Specs（布局规则）

**1、以下ASLayoutSpec子类，用于组成简单或复杂的布局**

| 布局规则                   | 说明   |
| ---------------------- | ---- |
| ASInsetLayoutSpec      | 插入布局 |
| ASOverlayLayoutSpec    | 覆盖布局 |
| ASBackgroundLayoutSpec | 背景布局 |
| ASCenterLayoutSpec     | 中心布局 |
| ASRatioLayoutSpec      | 比例布局 |
| ASStackLayoutSpec      | 堆叠布局 |
| ASAbsoluteLayoutSpec   | 绝对布局 |

你可以子类化ASLayoutSpec，自定义ASLayoutSpec



### 四、ASInsetLayoutSpec（插入布局规则）

```shell
在布局过程中，ASInsetLayoutSpec通过constrainedSize.max传递插入减掉后的CGSize给子项，一旦子项确定它的最终尺寸，插入规则将其最终尺寸加上其插入边距向上传递，由于插图布局规则的大小基于其子项的大小，所以子项必须具有固有大小或明确设置其大小。
```


![ASInsetLayoutSpec-diagram-1.png](http://upload-images.jianshu.io/upload_images/1519620-ff1e51d715a38b30.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**1、如果在UIEdgeInsets中设置了INFINITY作为值，插入规则只使用子项固有大小。**

**代码：**

```objective-c
//Objective-C
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
  ...
  UIEdgeInsets *insets = UIEdgeInsetsMake(10, 10, 10, 10);
  ASInsetLayoutSpec *headerWithInset = insetLayoutSpecWithInsets:insets child:textNode];
  ...
}
```



### 五、ASOverlayLayoutSpec（覆盖布局规则）

```shell
ASOverlayLayoutSpec布局一个组件(红色)，作为覆盖伸展到另个组件(蓝色)之前覆盖布局的大小，是根据子项的大小计算得出的。下图中，子项是蓝色层，然后子项的大小作为constrainedSize传递给覆盖布局元素（红色层），子项（蓝色层）必须具有固有大小或在其上设置的大小。
```



![ASOverlayLayouSpec-diagram-2.png](http://upload-images.jianshu.io/upload_images/1519620-0422d17a71fa710c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**代码：**

```objective-c
//Objective-C
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
  ASDisplayNode *backgroundNode = ASDisplayNodeWithBackgroundColor([UIColor blueColor]);
  ASDisplayNode *foregroundNode = ASDisplayNodeWithBackgroundColor([UIColor redColor]
  return [ASOverlayLayoutSpec overlayLayoutSpecWithChild:backgroundNode overlay:foregroundNode]];
}
```



### 六、ASBackgroundLayoutSpec（背景布局规则）

```shell
ASBackgroundLayoutSpec布局一个组件(红色)，作为背景伸展到另一个组件(蓝色)之后背景布局的大小，是根据子项的大小计算得出的。下图中，子项是蓝色层，然后，子项的大小作为constrainedSize传递给背景布局元素（红色层），子项（蓝色层）必须具有固有大小或在其上设置的大小。
```

![ASBackgroundLayoutSpec-diagram-3.png](http://upload-images.jianshu.io/upload_images/1519620-8b1c2778b3eac0fa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**代码：**

```objective-c
//Objective-C
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
  ASDisplayNode *backgroundNode = ASDisplayNodeWithBackgroundColor([UIColor redColor]);
  ASDisplayNode *foregroundNode = ASDisplayNodeWithBackgroundColor([UIColor blueColor]);
  return [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:foregroundNode background:backgroundNode]];
}
```



### 七、ASCenterLayoutSpec（中心布局规则）

```shell
ASCenterLayoutSpec将其子项居中在其最大值中constrainedSize。
如果中心规格的宽度或高度不受约束，它会缩小到子项的大小。
```

**ASCenterLayoutSpec的两个属性：**

| 属性               | 说明       | 值                                      |
| ---------------- | -------- | -------------------------------------- |
| centeringOptions | 确定中心位置   | None，X，Y，XY                            |
| sizingOptions    | 确定中心占用空间 | Default，minimum X，minimum Y，minimum XY |

![ASCenterLayoutSpec-diagram-4.png](http://upload-images.jianshu.io/upload_images/1519620-1e1f2a73adec099d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**代码：**

```objective-c
//Objective-C
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
  ASStaticSizeDisplayNode *subnode = ASDisplayNodeWithBackgroundColor([UIColor greenColor], CGSizeMake(70, 100));
  return [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY
                                             sizingOptions:ASRelativeLayoutSpecSizingOptionDefault
                                                     child:subnode]
}
```



### 八、ASRatioLayoutSpec（比例布局规则）

```shell
ASRatioLayoutSpec布局缩放固定宽高比，此规则必须具有作为constrainedSize传递给它的宽度或高度，因为它使用此值来缩放自身。
使用比例布局为ASNetworkImageNode或ASVideoNode提供固有大小是非常常见的，因为两者在服务器返回内容之前都没有内在大小。
```

![ASRatioLayoutSpec-diagram-5.png](http://upload-images.jianshu.io/upload_images/1519620-43adf82af6b89df1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**代码：**

```objective-c
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
  //一半比例
  ASStaticSizeDisplayNode *subnode = ASDisplayNodeWithBackgroundColor([UIColor greenColor], CGSizeMake(100, 100));
  return [ASRatioLayoutSpec ratioLayoutSpecWithRatio:0.5 child:subnode];
}
```



### 九、ASRelativeLayoutSpec（相对布局规则）

```shell
根据垂直和水平位置说明范围内布局组件,子项可以被定位在4个角中的任何一个，或者4个边缘中的任何一个，以及中心。
```

**代码：**

```objective-c
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
  ...
  ASDisplayNode *backgroundNode = ASDisplayNodeWithBackgroundColor([UIColor redColor]);
  ASStaticSizeDisplayNode *foregroundNode = ASDisplayNodeWithBackgroundColor([UIColor greenColor], CGSizeMake(70, 100));

  ASRelativeLayoutSpec *relativeSpec = [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionStart
                                verticalPosition:ASRelativeLayoutSpecPositionStart
                                    sizingOption:ASRelativeLayoutSpecSizingOptionDefault                                                                       
                                           child:foregroundNode]

  ASBackgroundLayoutSpec *backgroundSpec = [ASBackgroundLayoutSpecbackgroundLayoutSpecWithChild:relativeSpec background:backgroundNode];
  ...
}
```



### 十、ASStackLayoutSpec（堆叠布局规则）

```shell
在ASDK中的所有layoutSpecs中，ASStackLayoutSpec是非常强大的，ASStackLayoutSpec使用flexbox算法来确定其子节点的位置和大小，Flexbox旨在在不同的屏幕尺寸上提供一致的布局，在堆叠布局中，以垂直或水平堆叠对齐item。堆叠布局可以是另一个堆叠布局的子布局，这使得可以使用堆叠布局规则创建几乎任何布局。
```

**ASStackLayoutSpec除了ASLayoutElement还有7个属性:**

| 属性                          | 说明     | 描述                                       |
| --------------------------- | ------ | ---------------------------------------- |
| direction                   | 方向     | 指定堆叠方向,如果设置了horizontalAlignment和verticalAlignment,它们将被再次解决，导致justifyContent和alignItems被相应地更新。 |
| spacing                     | 间距     | 每个子元素之间的距离。                              |
| horizontalAlignment         | 水平对齐   | 指定子元素如何水平排列,取决于堆叠方向，设置对齐会导致justifyContent或alignItems被更新。未来方向更改后，对齐将保持有效。因此，优选那些性质。 |
| verticalAlignment           | 竖直对齐   | 指定子元素如何垂直排列,取决于堆叠方向，设置对齐会导致justifyContent或alignItems被更新。未来方向更改后，对齐将保持有效。因此，优选那些性质。 |
| justifyContent              | 对齐内容   | 每个子元素之间的距离。                              |
| alignItems                  | 对齐Item | 子元素沿着横轴的方向。                              |
| baselineRelativeArrangement | 基线相对布局 | 如果YES，则从顶视图的最后基线到底视图的顶部测量两个视图之间的垂直间距。    |

**代码：**

```objective-c
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{

  ASStackLayoutSpec *mainStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal                                                                                   spacing:6.0
        justifyContent:ASStackLayoutJustifyContentStart
     alignItems:ASStackLayoutAlignItemsCenter
                  children:@[_iconNode, _countNode]];

  //设置一些大小约束
  mainStack.minWidth = ASDimensionMakeWithPoints(60.0);
  mainStack.maxHeight = ASDimensionMakeWithPoints(40.0);

  return mainStack;
}
```

**说明:**

Flexbox在AsyncDisplayKit中的工作方式与在Web上的CSS中的工作方式相同，有一些例外。
默认值不同，没有flex参数，flexGrow和flexShrink只支持一个布尔值。



### 十一、ASAbsoluteLayoutSpec（绝对布局约束）

```shell
在ASAbsoluteLayoutSpec中，可以通过设置其layoutPosition属性来指定其子元素的确切位置（x / y坐标），绝对布局比其他类型的布局更不灵活和难以维护。
```

**ASAbsoluteLayoutSpec属性：**

| 属性     | 说明   | 值                     |
| ------ | ---- | --------------------- |
| sizing | 大小   | Default / Size to Fit |

确定绝对规格将占用多少空间。
注意：Size to Fit选项将复制旧的ASStaticLayoutSpec行为。

**代码：**

```objective-c
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{

  CGSize maxConstrainedSize = constrainedSize.max;

  //在静态布局中布局所有Node
  guitarVideoNode.layoutPosition = CGPointMake(0, 0);
  guitarVideoNode.size = ASSizeMakeFromCGSize(CGSizeMake(maxConstrainedSize.width, maxConstrainedSize.height / 3.0));

  nicCageVideoNode.layoutPosition = CGPointMake(maxConstrainedSize.width / 2.0, maxConstrainedSize.height / 3.0);
  nicCageVideoNode.size = ASSizeMakeFromCGSize(CGSizeMake(maxConstrainedSize.width / 2.0, maxConstrainedSize.height / 3.0));

  simonVideoNode.layoutPosition = CGPointMake(0.0, maxConstrainedSize.height - (maxConstrainedSize.height / 3.0));
  simonVideoNode.size = ASSizeMakeFromCGSize(CGSizeMake(maxConstrainedSize.width/2, maxConstrainedSize.height / 3.0));

  hlsVideoNode.layoutPosition = CGPointMake(0.0, maxConstrainedSize.height / 3.0);
  hlsVideoNode.size = ASSizeMakeFromCGSize(CGSizeMake(maxConstrainedSize.width / 2.0, maxConstrainedSize.height / 3.0));

  return [ASAbsoluteLayoutSpec absoluteLayoutSpecWithChildren:@[guitarVideoNode, nicCageVideoNode, simonVideoNode, hlsVideoNode]];
}
```



### 十二、ASLayoutSpec（布局规则）

```shell
ASLayoutSpec是所有布局规则都被子类化的父类，它的主要工作是处理和管理所有的子类，但它也可以用于创建自定义布局规格，只有超级高级应该希望/需要创建ASLayoutSpec的自定义子类。相反，尝试使用提供的布局规则，并将它们组合在一起以创建更高级的布局。
```

ASLayoutSpec的另一个用途是充当ASStackLayoutSpec中的其他子元素，在使用.flexGrow和/或.flexShrink时。

**代码：**

```objective-c
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
  ...
  // ASLayoutSpec作为间隔
  let spacer = ASLayoutSpec()
  spacer.flexGrow = true

  stack.children = [imageNode, spacer, textNode]
  ...
}
```



### 十三、Layout Element Properties（布局元素属性）

| 属性                                 | 说明                        |
| ---------------------------------- | ------------------------- |
| ASStackLayoutElement Properties    | 只对**stack**堆叠布局的Node生效    |
| ASAbsoluteLayoutElement Properties | 只对**absolute**绝对布局的Node生效 |
| ASLayoutElement Properties         | 对所有布局和Node生效              |



### 十四、ASStackLayoutElement Properties（堆叠布局元素属性）

| 属性                       | 类型                          | 描述                                       |
| :----------------------- | :-------------------------- | :--------------------------------------- |
| **.style.spacingBefore** | **CGFloat**                | 在堆叠方向上放置此对象之前的额外空间。                      |
| **.style.spacingAfter**  | **CGFloat**                | 在堆叠方向上放置此对象之后的额外空间。                      |
| **.style.flexGrow**      | **BOOL**                    | 如果子元素的堆叠大小的总和小于最小大小，那么这个对象是否增长？          |
| **.style.flexShrink**    | **BOOL**                   | 如果子元素的堆叠大小的总和大于最大大小，那么这个对象是否缩小？          |
| **.style.flexBasis**     | **ASDimension**             | 使用flexGrow或flexShrink属性并分配剩余空间之前，在堆栈维度（水平或垂直）中指定此对象的初始大小。 |
| **.style.alignSelf**     | **ASStackLayoutAlignSelf** | 沿着横轴的对象的方向，覆盖alignItems。(ASStackLayoutAlignSelfAuto，ASStackLayoutAlignSelfStart， ASStackLayoutAlignSelfEnd，  ASStackLayoutAlignSelfCenter，  ASStackLayoutAlignSelfStretch) |
| **.style.ascender**      | **CGFloat**                | 用于基线对准。从对象的顶部到其基线的距离。                    |
| **.style.descender**     | **CGFloat**                | 用于基线对准。从对象的底部部到其基线的距离                    |



### 十五、ASAbsoluteLayoutElement Properties（绝对布局元素属性）

| 属性                        | 类型           | 描述                                      |
| :------------------------ | :----------- | :-------------------------------------- |
| **.style.layoutPosition** | **CGPoint** | 该对象在ASAbsoluteLayoutSpec父规则中的CGPoint位置。 |



### 十六、ASLayoutElement Properties（布局元素属性）

| 属性                             | 类型               | 描述                                       |
| :----------------------------- | :--------------- | :--------------------------------------- |
| **.style.width**               | **ASDimension**  | 设置元素的宽度。 会被minWidth和maxWidth覆盖。默认为ASDimensionAuto |
| **.style.height**              | **ASDimension**  | 设置元素的高度。 会被minHeight和maxHeight覆盖。默认为ASDimensionAuto。 |
| **.style.minHeight**           | **ASDimension**  | 设置元素的最大高度。 它防止height属性的已使用值变得大于为maxHeight指定的值。 maxHeight的值覆盖height，但minHeight覆盖maxHeight。默认为ASDimensionAuto |
| **.style.maxHeight**           | **ASDimension**  | 如果子元素的堆栈大小的总和大于最大大小，那么这个对象是否应该缩小呢？       |
| **.style.minWidth**            | **ASDimension**  | 设置元素的最小宽度。它防止width属性的使用值变得小于为minWidth指定的值。 minWidth的值覆盖maxWidth和width。默认为ASDimensionAuto |
| **.style.maxWidth**            | **ASDimension**  | 设置元素的最大宽度。 它防止width属性的使用值变得大于为maxWidth指定的值。 maxWidth的值覆盖width，但minWidth覆盖maxWidth。默认为ASDimensionAuto |
| **.style.preferredSize**       | **CGSize**      | 提供布局元素的建议大小。 如果提供了可选的minSize或maxSize，且preferredSize超过这些，则将强制执行minSize或maxSize, 如果未提供此可选值，则布局元素的大小将默认为其提供的内在内容大小calculateSizeThatFits： |
| **.style.minSize**             | **CGSize**      |                                          |
| **.style.maxSize**             | **CGSize**      |                                          |
| **.style.preferredLayoutSize** | **ASLayoutSize** |                                          |
| **.style.minLayoutSize**       | **ASLayoutSize** |                                          |
| **.style.maxLayoutSize**       | **ASLayoutSize** |                                          ...|



![](http://upload-images.jianshu.io/upload_images/1519620-ed4d838f20e55167.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



# Demo

[Demo地址](https://github.com/Luis-X/AsyncDisplayKitStudy)

![AsyncDisplaykit2.0使用](http://upload-images.jianshu.io/upload_images/1519620-95e102cb835aa438.gif?imageMogr2/auto-orient/strip)
