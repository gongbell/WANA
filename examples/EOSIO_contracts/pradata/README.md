
# ProChain Rating DApp

* A dapp gives rating data provided by [`prochaintech`](https://eosflare.io/account/prochaintech)

* ProRating是ProChain(般若)开源的链上账号评级合约，在链上存储全网账号属性，能够标注出合约账号、羊毛党黑名单、PRA KYC人脸比对结果、PRA CandyBox人机滑块验证结果，并具备数据实时更新特性。

* DAPP开发者只需包含该头文件，即可在合约内部通过代码查询数据，适用于DAPP开发者防范合约攻击、防范羊毛党攻击、免人机滑块验证等应用场景。

## Features
* **全网账号上链，区分合约账户、羊毛党黑名单、KYC白名单**
    * ProRating将全网账号上链，每个账号有账号类型、账号评级属性
    * ProChain(般若)承担该合约各项成本，如RAM、CPU、NET开销

* **数据实时生效，同步上链**
    * 实时监测PRA CandyBox的羊毛党黑名单、KYC白名单、人机滑块验证结果，同步上链
    * 实时监测各账号的Set Code行为，标注出合约账号，同步上链

* **应用简单，有包含头文件、接口回调两种使用方式**
    * DAPP开发者包含该头文件，即可在合约内部通过代码查询数据
    * ProRating合约已陆续开发API，DAPP开发者可在链上调用该接口查询，并通过回调接口获知结果

## EOS Mainnet 主网部署情况

* **contract account**: [`rating.pra`](https://eosflare.io/account/rating.pra)，**scope**: `rating.pra`
* **合约账号**：[`rating.pra`](https://eosflare.io/account/rating.pra)，**scope**: `rating.pra`
 
* 查询链上数据：
 ```
 cleos get table rating.pra rating.pra trating
 ```

## Data Structure 数据结构

### Table `trating` 账号表
- `account` eos account name 账号名称
- `account_type` enum_account_type: 0, normal account; 1, code account; 账号类型：0, 普通账号; 1, 合约账号;
- `normal_account_level` rating level for normal account, from 0 to 10 普通账号评分：从0到10，分数越低，账号属性越差
- `code_account_level` rating level for code account, from 0 to 10 合约账号评分：从0到10，分数越低，账号属性越差

### enum `enum_account_type` 枚举类型
- 0, `normal_account` 普通账号
- 1, `code_account` 合约账号

### level defined for both normal and code account 普通账号和合约账号共用评分
- `ACCOUNT_LEVEL_DEFAULT`: 5 账号默认评分，5分 
- `BP_BLACKLIST`: 0 被ECAF或BP拉黑的账号，0分；数据源详见[https://bloks.io/blacklist](https://bloks.io/blacklist)

### level defined for normal account 普通账号评分
- `PRABOX_BLACKLIST`: 2 被PRA CandyBox拉黑的羊毛党账号，2分
- `PRABOX_GREYLIST`: 3 被PRA CandyBox加灰的疑似羊毛党账号，3分
- `PRABOX_AUTH_VERYFIED`: 6 在24小时内，通过PRA CandyBox人机滑块验证的账号，6分
- `PRABOX_KYC_VERYFIED`: 6 通过PRA KYC人脸比对验证的账号，6分

### level defined for code account 合约账号评分
- `MALICIOUS_CODE_ACCOUNT`: 0 已知恶意合约账号，如实施过合约攻击行为，0分

### Call Back API 回调接口
* TBD
* 已实现checkblack检查账号是否在黑名单的接口，并以回调方式通知调用方
* 其余接口待实现，欢迎通过issue提出需求

### call back results 回调结果
- `RESULT_FOUND`: "FOUND" 找到账号
- `RESULT_NOTFOUND`: "NOTFOUND" 未找到账号

## Sample Codes 示例代码
* [demo.cpp](https://github.com/ProChain/ProRatingEOS/blob/master/demo/demo.cpp)
* [demo_readme](https://github.com/ProChain/ProRatingEOS/blob/master/demo/README.md)

## Known Users 已知用户
* ![logo](https://prowebsitebj.oss-cn-beijing.aliyuncs.com/website/topbidderlogo.png) 
**捕域达人** **Top Bidder**  [https://chain.pro/domain-auction/](https://chain.pro/domain-auction/)

* ![logo](https://prowebsitebj.oss-cn-beijing.aliyuncs.com/website/eosdice.png) 
**EOS Dice** [https://eosdice.vip/](https://eosdice.vip/)

* 按照登记顺序排序，更多接入DAPP，欢迎在[https://github.com/ProChain/ProRatingEOS/issues/1](https://github.com/ProChain/ProRatingEOS/issues/1)登记

## Contribution
  * Source Code: [https://github.com/ProChain/ProRatingEOS](https://github.com/ProChain/ProRatingEOS)
  * Issue Tracker: [https://github.com/ProChain/ProRatingEOS/issues](https://github.com/ProChain/ProRatingEOS/issues)
  
## Support 
<table>
  <thead>
    <th>ProChain微信助手 WeChat Assistant<br />WeChat No：ProChain3</th>
  </thead>
  <tbody>
    <tr>
      <td><img src="https://chain.pro/h5/static/img/qrcode.1723181.png" alt="support-1" width="150" height="150"></td>
    </tr>
  </tbody>
</table>

## License
    The MIT License
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
