# Sync Aggregator RTL 验证环境

## 快速开始

```bash
# 进入验证目录
cd /home/yian/project_autotest/QKQ_RTL_GEN/sync_aggr/test_sync_aggr

# 编译RTL
make compile

# 清理并重新编译
make recompile
```

## 目录结构

```
test_sync_aggr/
├── Makefile        # 编译配置
├── rtl.f           # RTL文件列表（79个.v文件）
├── sim/            # VCS编译输出
│   └── simv        # 仿真可执行文件
└── README.md       # 本文档
```

## 常用命令

| 命令 | 作用 |
|------|------|
| `make compile` | 编译RTL（总是完整重编译） |
| `make recompile` | 清理后重新编译 |
| `make check` | 检查环境配置 |
| `make clean` | 清理所有生成文件 |
| `make help` | 显示帮助信息 |

## 工具版本

- **VCS**: V-2023.12-SP2 (`/home/yian/Synopsys/vcs/V-2023.12-SP2`)
- **Verdi**: V-2023.12-SP2 (`/home/yian/Synopsys/verdi/V-2023.12-SP2`)
- **RTL路径**: `/home/yian/project_autotest/QKQ_RTL_GEN/sync_aggr`

## rtl.f 文件格式

使用 `${SYNC_AGGR_ROOT}` 宏变量，编译时自动展开：

```verilog
// 头文件路径
+incdir+${SYNC_AGGR_ROOT}/AS6D_APP

// RTL文件
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app.v
```

## 关键VCS选项

- `-ntb_opts dtm`: 禁用自动文件发现
- `-debug_access+all`: 完全调试功能
- `-kdb`: 生成Verdi数据库
- Verdi PLI: 自动集成波形查看

## 修改RTL后的流程

```bash
# 1. 编辑RTL
vim ../pipe_mask_ctrl.v

# 2. 编译
make compile

# 3. 查看结果
tail -20 compile.log
```

---

**更新**: 2025-11-05 | **状态**: 编译环境就绪
