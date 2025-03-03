<p align="center">
  <img src="https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/icon_512x512-1671278252.png" height="256">
  <h1 align="center">Easydict</h1>
  <h4 align="center"> Easy to look up words or translate text</h4>
<p align="center"> 
<a href="https://github.com/tisfeng/Easydict/blob/main/README.md">
        <img src="https://img.shields.io/badge/%E4%B8%AD%E6%96%87-Chinese-green"
            alt="中文 README"></a>
<a href="https://github.com/tisfeng/Easydict/blob/main/docs/README_EN.md">
        <img src="https://img.shields.io/badge/%E8%8B%B1%E6%96%87-English-green"
            alt="English README"></a>
<a href="https://github.com/tisfeng/easydict/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/tisfeng/easydict"
            alt="License"></a>
<a href="https://github.com/tisfeng/Easydict/releases">
        <img src="https://img.shields.io/github/downloads/tisfeng/easydict/total.svg"
            alt="Downloads"></a>
</p>

## Easydict 易词典[【English】](https://github.com/tisfeng/Easydict/blob/main/docs/README_EN.md)

`Easydict` 是一个简洁易用的翻译词典 macOS App，能够轻松优雅地查找单词或翻译文本。Easydict 开箱即用，能自动识别输入文本语言，支持输入翻译，划词翻译和 OCR 截图翻译，可同时查询多个翻译服务结果，目前支持[有道词典](https://www.youdao.com/)，🍎**苹果系统翻译**，[DeepL](https://www.deepl.com/translator)，[谷歌](https://translate.google.com)，[百度](https://fanyi.baidu.com/)和[火山翻译](https://translate.volcengine.com/translate)。

**查单词**
![iShot_2023-01-28_17.40.28-1674901716](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/iShot_2023-01-28_17.40.28-1674901716.png)

**翻译文本**
![iShot_2023-01-28_17.49.53-1674901731](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/iShot_2023-01-28_17.49.53-1674901731.png)

## 功能

- [x] 开箱即用，便捷查询单词或翻译文本。
- [x] 自动识别输入语言，自动查询目标偏好语言。
- [x] 自动划词查询，划词后自动显示查询图标，鼠标悬浮即可查询。
- [x] 支持为不同窗口配置不同的服务。
- [x] 支持系统 OCR 截图翻译。
- [x] 支持系统 TTS。
- [x] 支持 macOS 系统翻译。详情请看 [如何在 Easydict 中使用 🍎 macOS 系统翻译？](https://github.com/tisfeng/Easydict/blob/main/docs/How-to-use-macOS-system-translation-in-Easydict-zh.md)
- [x] 支持有道词典，DeepL，Google，百度和火山翻译，不需要 Key，完全免费！
- [x] 支持 48 种语言。

下一步：

- [ ] 支持翻译服务 API 调用，如 DeepL。
- [ ] 支持更多查询服务。
- [ ] 支持 macOS 系统词典。

_**如果觉得这个应用还不错，给个 [Star](https://github.com/tisfeng/Easydict) ⭐️ 支持一下吧 (^-^)**_

### 安装

[下载](https://github.com/tisfeng/Easydict/releases) 最新版本的 Easydict。

#### 签名问题 ⚠️

Easydict 是开源软件，本身是安全的，但由于苹果严格的检查机制，打开时可能会遇到警告拦截。


- 如果遇到下面 [无法打开 Easydict 问题](https://github.com/tisfeng/Easydict/issues/2)，请参考苹果使用手册 [打开来自身份不明开发者的 Mac App](https://support.apple.com/zh-cn/guide/mac-help/mh40616/mac)

> 无法打开“Easydict.dmg”，因为它来自身份不明的开发者。

<div style="display: flex; justify-content: space-between;">
  <img src="https://user-images.githubusercontent.com/25194972/219873635-46e9d318-7237-462b-be69-44ad7a3ea760.png" width="40%" />
</div>
<div style="display: flex; justify-content: space-between;">
  <img src="https://user-images.githubusercontent.com/25194972/219873809-2b407852-7f77-4aef-9206-3f6393cb7c31.png" width="100%" />
</div>


- 如果提示应用已损坏，请参考 [macOS 绕过公证和应用签名方法](https://www.5v13.com/sz/31695.html)

> “Easydict” 已损坏，无法打开。


在终端里输入以下命令，并输入密码即可。

```bash
sudo xattr -rd com.apple.quarantine /Applications/Easydict.app
```

---

### 使用

Easydict 启动之后，除了应用主界面（默认隐藏），还会有一个菜单图标，点击菜单选项即可触发相应的功能，如下所示：

<div style="display: flex; justify-content: space-between;">
  <img src="https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/iShot_2023-01-04_17.01.56-1672847630.png" width="60%" />
</div> <br>

| 方式           | 描述                                                                              | 预览                                                                                                                                           |
| -------------- | --------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| 快捷键划词翻译 | 选中需要翻译的文本之后，按下划词翻译快捷键即可（默认 `⌥ + D`）                    | ![iShot_2023-01-20_11.24.37-1674185125](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/iShot_2023-01-20_11.24.37-1674185125.gif) |
| 自动划词翻译   | 划词后自动显示查询图标，鼠标悬浮或点击即可查询                                    | ![iShot_2023-01-20_11.01.35-1674183779](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/iShot_2023-01-20_11.01.35-1674183779.gif) |
| 截图翻译       | 按下截图翻译快捷键（默认 `⌥ + S`），截取需要翻译的区域                            | ![iShot_2023-01-20_11.26.25-1674185209](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/iShot_2023-01-20_11.26.25-1674185209.gif) |
| 输入翻译       | 按下输入翻译快捷键（默认 `⌥ + A` 或 `⌥ + F`），输入需要翻译的文本，`Enter` 键翻译 | ![iShot_2023-01-20_11.28.46-1674185354](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/iShot_2023-01-20_11.28.46-1674185354.gif) |

#### 注意 ⚠️

1.划词翻译，需要开启 `辅助功能` 权限，需先使用一次 **快捷键划词翻译**，触发申请辅助功能权限，之后才能正常使用自动划词翻译功能。

2.截图翻译，需要开启 `屏幕录制` 权限，应用仅会在第一次使用 **截图翻译** 时会自动弹出权限申请对话框，若授权失败，后续需自己去系统设置中开启。

### 翻译服务

**目前支持有道词典，苹果系统翻译，DeepL，Google，百度和火山翻译服务。**

> 注意 ⚠️： Google 翻译中国版已无法使用，只能使用国际版，因此需要走代理才能使用 Google 翻译。

各项翻译服务支持的语言详情如下：

| 语言         | 有道词典 | 🍎 系统翻译 | DeepL 翻译 | Google 翻译 | 百度翻译 | 火山翻译 |
| :----------- | :------: | :---------: | :--------: | :---------: | :------: | :------: |
| 中文（简体） |    ✅    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 中文（繁体） |    ✅    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 英语         |    ✅    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 日语         |    ✅    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 韩语         |    ✅    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 法语         |    ✅    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 西班牙语     |    ❌    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 葡萄牙语     |    ❌    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 意大利语     |    ❌    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 德语         |    ❌    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 俄语         |    ❌    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 阿拉伯语     |    ❌    |     ✅      |     ❌     |     ✅      |    ✅    |    ✅    |
| 瑞典语       |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 罗马尼亚语   |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 泰语         |    ❌    |     ✅      |     ❌     |     ✅      |    ✅    |    ✅    |
| 斯洛伐克语   |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 荷兰语       |    ❌    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 匈牙利语     |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 希腊语       |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 丹麦语       |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 芬兰语       |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 波兰语       |    ❌    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 捷克语       |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 土耳其语     |    ❌    |     ✅      |     ❌     |     ✅      |    ✅    |    ✅    |
| 立陶宛语     |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 拉脱维亚语   |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 乌克兰语     |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 保加利亚语   |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 印尼语       |    ❌    |     ✅      |     ✅     |     ✅      |    ✅    |    ✅    |
| 马来语       |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 斯洛文尼亚语 |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 爱沙尼亚语   |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 越南语       |    ❌    |     ✅      |     ❌     |     ✅      |    ✅    |    ✅    |
| 波斯语       |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 印地语       |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 泰卢固语     |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 泰米尔语     |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 乌尔都语     |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 菲律宾语     |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 高棉语       |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 老挝语       |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 孟加拉语     |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 缅甸语       |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 挪威语       |    ❌    |     ❌      |     ✅     |     ✅      |    ✅    |    ✅    |
| 塞尔维亚语   |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 克罗地亚语   |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 蒙古语       |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |
| 希伯来语     |    ❌    |     ❌      |     ❌     |     ✅      |    ✅    |    ✅    |

### 偏好设置

设置页提供了一些偏好设置修改，如开启查询后自动播放单词发音，修改翻译快捷键，开启、关闭服务，或调整服务顺序等。

#### 设置

![iShot_2023-02-19_11.33.51](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/iShot_2023-02-19_11.33.51-1676783205.png)


#### 服务

Easydict 有 3 种窗口类型，可以分别为它们设置不同的服务。

- 迷你窗口：鼠标自动取词时显示。
- 侧悬浮窗口：快捷键取词和截图翻译时显示。
- 主窗口：默认关闭，可在设置中开启，程序启动时显示。（稍后会增强主窗口功能）

![iShot_2023-01-20_11.47.34-1674186506](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/iShot_2023-01-20_11.47.34-1674186506.png)

### 其他快捷键

- `Enter`: 输入文本后，按下 Enter 开始查询。
- `Shift + Enter`: 输入换行。
- `Cmd + Enter`: 默认打开 Google 搜索引擎，搜索内容为输入文本，效果等同手动点击右上角的浏览器搜索图标。
- `Opt + Enter`: 若电脑上安装了欧路词典 App，则会在 Google 图标左边显示一个 Eudic 图标，动作为打开欧路词典 App 查询。

## 相关项目

- [Raycast-Easydict](https://github.com/tisfeng/Raycast-Easydict) 是一个 Raycast 扩展版本的 Easydict。

![easydict-1-1671806758](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/easydict-1-1671806758.png)

## 动机

查询单词和翻译文本，是日常生活非常实用的功能，我用过很多翻译词典软件，但都不满意，直到遇见了 Bob。[`Bob`](https://bobtranslate.com/) 是一款优秀的翻译软件，但它不是开源软件，自从上架苹果商店后也不再免费提供应用更新。

作为一名开发者，也是众多开源软件的受益者，我觉得，这世界上应该存在一个免费开源版本的 [Bob](https://github.com/ripperhe/Bob)，于是我开发了 [Easydict](https://github.com/tisfeng/Easydict)。现在，我每天都在大量使用 Easydict，我很喜欢它，也希望能够让更多的人了解它、使用它。

开源，让世界更美好。

## 感谢

这个项目的灵感来自 [saladict](https://github.com/crimx/ext-saladict) 和 [Bob](https://github.com/ripperhe/Bob)，且初始版本是以 [Bob](https://github.com/cheonvo/Bob) 为基础开发。Easydict 在原项目上进行了许多改进和优化，很多功能和 UI 都参考了 Bob，感谢原作者 [ripperhe](https://github.com/ripperhe)。

> [`Bob`](https://bobtranslate.com/) 是一款 macOS 平台 **翻译** 和 **OCR** 软件。

## 声明

Easydict 作为一个自由免费的开源项目，仅供学习交流，任何人均可免费获取产品与源码。如果认为你的合法权益收到侵犯请马上联系[作者](https://github.com/tisfeng)。

Easydict 为 [GPL-3.0](https://github.com/tisfeng/Easydict/blob/main/LICENSE) 开源协议，你可以随意使用源码，但必须附带该许可与版权声明。
