# TWRP Builder - GitHub Actions

通过 GitHub Actions 自动编译 TWRP Recovery，无需本地编译环境。

## 支持设备

| 设备 | 代号 | 芯片 |
|------|------|------|
| Realme GT Neo | realme_gt_neo | MediaTek Dimensity 1200 (MT6893) |

## 快速开始

### 1. Fork 本仓库

点击右上角 Fork 按钮，将仓库复制到你的 GitHub 账号下。

### 2. 触发编译

1. 进入你的 Fork 仓库
2. 点击 **Actions** 标签页
3. 选择左侧 **Build TWRP Recovery** 工作流
4. 点击 **Run workflow** 按钮
5. 填写参数：
   - **device_name**: 设备代号，如 `realme_gt_neo`
   - **twrp_branch**: TWRP 分支版本，可选 `twrp-12.1`、`twrp-11`、`twrp-10.0`
   - **device_tree_repo**: 外部 Device Tree 仓库地址（可选，留空则使用本地配置）
   - **device_tree_branch**: Device Tree 分支
   - **make_clean**: 是否清理编译缓存
6. 点击 **Run workflow** 开始编译

### 3. 下载产物

编译完成后（约 2-3 小时），在 Actions 运行详情页底部可下载：
- `recovery.img` - TWRP Recovery 镜像

## 添加新设备

### 方式一：使用本地 Device Tree

1. 在 `device/` 目录下创建设备文件夹
2. 添加以下必要文件：
   - `AndroidProducts.mk` - 产品定义
   - `Android.mk` - 构建入口
   - `BoardConfig.mk` - 板级配置
   - `omni_<设备代号>.mk` - 设备 Makefile
   - `recovery.fstab` - 分区挂载表
3. 放入预编译内核到 `device/<设备>/prebuilt/Image.gz-dtb`

### 方式二：使用外部 Device Tree

在触发工作流时填写 `device_tree_repo` 参数，指向 GitHub 上的 Device Tree 仓库。

## 工作流参数说明

| 参数 | 说明 | 必填 | 默认值 |
|------|------|------|--------|
| device_name | 设备代号 | 是 | realme_gt_neo |
| twrp_branch | TWRP 分支 | 是 | twrp-12.1 |
| device_tree_repo | 外部 DT 仓库 | 否 | (空) |
| device_tree_branch | DT 分支 | 否 | android-12.1 |
| make_clean | 清理缓存 | 否 | 否 |

## 项目结构

```
twrp-builder/
├── .github/
│   └── workflows/
│       └── build-twrp.yml      # GitHub Actions 工作流
├── device/
│   └── realme_gt_neo/          # 设备配置文件
│       ├── Android.mk
│       ├── AndroidProducts.mk
│       ├── BoardConfig.mk
│       ├── omni_realme_gt_neo.mk
│       └── recovery.fstab
└── README.md
```

## 注意事项

- GitHub Actions 免费额度：每月 2000 分钟（公开仓库免费）
- 单次编译约需 2-3 小时
- 首次编译需要同步完整 TWRP 源码（约 30GB），建议使用 ccache 加速后续编译
- 编译环境为 Ubuntu 22.04，4 核 CPU，16GB 内存

## License

本项目遵循 Apache 2.0 许可证。
