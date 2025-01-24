# Ruby Gauge 自动化测试项目

## 项目概述

这是一个基于 Gauge 框架的 Ruby 自动化测试项目，集成了 API 测试和 Web UI 测试功能。项目使用了多个现代化的测试工具和库，包括 Selenium WebDriver、Capybara 和 HTTParty，以实现全面的自动化测试覆盖。

## 环境要求

### 系统要求
- Ruby 3.1 或更高版本
- Gauge
- Chrome 浏览器（用于 UI 测试）

### 依赖组件
```ruby
# 主要依赖
gem 'test-unit' # 单元测试框架
gem 'gauge-ruby' # Gauge 测试框架的 Ruby 支持
gem 'httparty' # HTTP 客户端，用于 API 测试
gem 'selenium-webdriver' # 浏览器自动化测试
gem 'capybara' # Web 应用测试框架
```

## 项目结构

```
├── .gauge/          # Gauge 配置文件
├── env/             # 环境配置
│   └── default/     # 默认环境配置
├── specs/           # 测试规范文件
│   ├── api_test.spec    # API 测试用例
│   └── login_test.spec  # 登录测试用例
├── step_implementations/  # 测试步骤实现
│   ├── api_steps.rb      # API 测试步骤
│   ├── pages/           # 页面对象
│   └── step_definitions/ # 步骤定义
└── reports/         # 测试报告
    └── html-report/  # HTML 格式的测试报告
```

## 测试用例说明

### API 测试
- 位置：`specs/api_test.spec`
- 实现：`step_implementations/api_steps.rb`
- 功能：测试 RESTful API 接口，包括请求和响应验证

### Web UI 测试
- 位置：`specs/login_test.spec`
- 实现：
  - `step_implementations/step_definitions/login_steps.rb`
  - `step_implementations/pages/login_page.rb`
- 功能：测试 Web 应用的登录功能，使用页面对象模式

## 执行测试

### 安装依赖
```bash
bundle install
```

### 运行所有测试
```bash
gauge run specs/
```

### 运行特定测试
```bash
gauge run specs/api_test.spec  # 运行 API 测试
gauge run specs/login_test.spec # 运行登录测试
```

## 测试报告

- 测试执行后，HTML 格式的报告将生成在 `reports/html-report/` 目录下
- 可以通过浏览器打开 `reports/html-report/index.html` 查看详细的测试结果

## 配置说明

### 环境配置
- 默认配置文件位于 `env/default/` 目录
- `default.properties`: 通用配置
- `ruby.properties`: Ruby 特定配置

### 日志
- 日志文件位于 `logs/gauge.log`
- 包含测试执行的详细信息和错误追踪

## 最佳实践

1. 使用页面对象模式组织 UI 测试代码
2. 保持测试规范（.spec 文件）简洁清晰
3. 合理组织步骤实现，保持代码可重用性
4. 定期维护和更新测试用例
5. 保持测试数据的独立性和可维护性

## 常见问题解决

1. 如果遇到浏览器驱动问题，请确保：
   - Chrome 浏览器已安装
   - Selenium WebDriver 版本与 Chrome 版本匹配

2. 如果测试执行失败，请检查：
   - 环境配置是否正确
   - 依赖是否完整安装
   - 测试数据是否有效

## 维护与支持

- 定期更新依赖包版本
- 保持与 Gauge 框架的版本兼容性
- 及时处理测试失败和问题报告