 "ng-zorro-antd": "1.0.0",
yarn add less@~2.7.0 less-loader@~4.0.0

# 开发环境安装


## 安装&配置
解压  node-v9.11.1-win-x64.7z 到 D:\nodejs\node-v9.11.1-win-x64


- 升级，删除旧版本

管理员用户进入cmd窗口
d:
cd D:\nodejs
 
npm uninstall -g @angular/cli
npm cache clean --force
npm uninstall -g @delon/cli 
npm uninstall -g yarn
npm cache verify --force
npm cache clean --force

npm config set prefix "D:\nodejs\node-v9.11.1-win-x64\node_global"
npm config set cache "D:\nodejs\node-v9.11.1-win-x64\node_cache"

//设置镜像
npm config set registry https://registry.npm.taobao.org

npm install -g @angular/cli@1.7.4  --unsafe-perm --no-optional
npm install -g  yarn  --unsafe-perm

//解压 delon-template到 d:/xx/dd/
cd d:/xx/dd
ng new -c=@delon/cli oa-platform-frontend --skip-install

cd oa-platform-frontend
修改 package.json
将 @delon/xx  "^版本号" 设置为 @delon/xx  "@1.0.0-beta.9"
"ng-zorro-antd" "^0.7.0-beta.5" 修改为  "ng-zorro-antd": "0.7.0-beta.5"
添加
"ngx-countdown": "2.1.0"
"qrious":"4.0.2"

yarn install

yarn remove ng-zorro-antd
yarn remove @delon/abc     @delon/acl     @delon/auth    @delon/theme    @delon/mock    @delon/form    @delon/cache  ngx-countdown
yarn remove ngx-countdown
yarn add ng-zorro-antd@0.7.0-beta.5


yarn add @delon/abc@1.0.0-beta.9 @delon/acl@1.0.0-beta.9 @delon/auth@1.0.0-beta.9 @delon/theme@1.0.0-beta.9  @delon/mock@1.0.0-beta.9 @delon/form@1.0.0-beta.9 @delon/cache@1.0.0-beta.9
yarn add ngx-countdown@2.1.0
yarn add qrious@4.0.2
yarn add ng-zorro-antd@0.7.0-beta.5 @delon/abc@1.0.0-beta.9 @delon/acl@1.0.0-beta.9 @delon/auth@1.0.0-beta.9 @delon/theme@1.0.0-beta.9  @delon/mock@1.0.0-beta.9 @delon/form@1.0.0-beta.9 @delon/cache@1.0.0-beta.9 ngx-countdown@2.1.0
Please choose a version of "@delon/form" from this list: 1.0.0-beta.6

git clone --depth=1 -b 1.0.0-beta.10 https://github.com/cipchk/ng-alain.git

yarn add qrious@4.0.2  //npm install qrious@4.0.2 --save     // --save-dev

- 安装nrm
npm install -g nrm  –unsafe-perm --no-optional

npm install -g @angular/cli –unsafe-perm  --no-optional

//创建项目
ng new oa-platform --style less  --skip-install

yarn add ng-zorro-antd

npm install -g @angular-devkit/core @angular-devkit/schematics  @schematics/schematics  rxjs
   (rxjs存在bug，/xx/user/xx接口时，只走mock，)

//  npm install -g @delon/cli  //不再使用

<!--  测试 start-->
new new oa-platform   --skip-install
cd oa-platform
yarn install
npm start
<!--  测试 end-->

ng update @angular/cli

// 主干采用的angualr6，zorro 不支持angualar 6， git clone --depth=1 https://github.com/cipchk/ng-alain.git
git clone --depth=1 -b 1.0.0-beta.10 https://github.com/cipchk/ng-alain.git
cd ng-alain
yarn install
yarn add rxjs-compat // npm i --save rxjs-compat
yarn add ng-zorro-antd

==============================================================================




## 安装&配置

解压  node-v9.11.1-win-x64.7z 到 D:\nodejs\node-v9.11.1-win-x64

- 升级，删除旧版本

管理员用户进入cmd窗口
d:
cd D:\nodejs
npm uninstall -g @delon/cli
npm uninstall -g yarn
npm cache verify --force
npm cache clean --force


npm config set prefix "D:\nodejs\node-v9.11.1-win-x64\node_global"
npm config set cache "D:\nodejs\node-v9.11.1-win-x64\node_cache"

- 安装nrm
npm install -g nrm
npm i -g  yarn

npm install -g @angular-devkit/core@0.4.6 @angular-devkit/schematics@0.4.6 @schematics/schematics@0.4.6
 rxjs@5.5.5  (rxjs存在bug，/xx/user/xx接口时，只走mock，)
 rxjs@5.5.10
npm install -g @angular/cli@1.6.2
npm install -g @delon/cli@1.0.0-beta.9

yarn global add @angular/cli@1.6.2
yarn global add @delon/cli@1.0.0-beta.9


copy D:\nodejs\node-v9.11.1-win-x64\node_global\node_modules\@delon 到 D:\nodejs\node-v9.11.1-win-x64\node_global\node_modules\@angular\cli\node_modules\@delon

cd D:\nodejs\node-v9.11.1-win-x64\node_global\node_modules
xcopy "@delon" "@angular\cli\node_modules\@delon" /s /e /y

npm install -g typescript typings
yarn global add typescript typings

直接使用 ng new 命令在创建ng-alain项目:
// ng new -c=@delon/cli my-alain
// ng new -c=@delon/cli my-alain --skip-install   //copy @delon后仍报异常  Error: Path "/package.json" does not exist. Path "/package.json" does not exist.
ng new my-alain --skip-install
cd my-alain
npm install @delon/cli --save-dev
npm install @delon/cli@1.0.0-beta.9 --save-dev

设置 .angular-cli.json 的默认 collection：

"defaults": {
  "schematics": {
    "collection": "@delon/cli"
  }
}

只保留node_modules和.angular-cli.json,其他全部删除
在 .angular-cli.json同级目录执行
ng new -c=@delon/cli lonely
ng new -c=@delon/cli my-alain --skip-install     //又可以了，卸载重新安装过 @angular-devkit/core@0.4.6 @angular-devkit/schematics@0.4.6 @schematics/schematics@0.4.6


yarn install

npm start

ERROR in src/app/shared/shared.module.ts(13,33): error TS2307: Cannot find module 'ngx-countdown'.


在package.js中添加     "ngx-countdown": "^2.0.0","rxjs": "^5.5.10",
结果如下
  "dependencies": {
        ...
      "ng-zorro-antd": "^0.7.0-beta.5",
      "ngx-countdown": "^2.0.0",
      "rxjs": "^5.5.10",
      ...
  }

  //rxjs 升级到5.5.10后仍存在，恢复rxjs 5.5.5   api/user/xx 的bug，采用 api/zuser/xx方式解决

yarn install

ng g page view -t=view --module=delon.module    //创建page组件，并制定import到哪个module中

<!-- nrm use taobao -->
<!-- npm config set registry https://registry.npm.taobao.org -->

<!-- npm install -g cnpm --registry=https://registry.npm.taobao.org -->
<!-- ng set --global packageManager=cnpm -->

ng serve --host 192.168.1.102 --port 4200


========================================================================================================================
解压  node-v9.11.1-win-x64.7z 到 D:\nodejs\node9.2.1
- 升级，删除旧版本 

管理员用户进入cmd窗口
d:
cd D:\nodejs
npm uninstall -g @delon/cli
npm cache verify --force
npm cache clean --force

npm config set prefix "D:\nodejs\node9.2.1\node_global"
npm config set cache "D:\nodejs\node9.2.1\node_cache"
- 安装nrm
npm install -g nrm
npm i -g  yarn
- 设置注册中心
nrm use taobao //相当于   npm config set registry https://registry.npm.taobao.org
npm config set disturl https://npm.taobao.org/dist

yarn config set registry https://registry.npm.taobao.org

yarn config set sass-binary-site http://npm.taobao.org/mirrors/node-sass

npm install -g @angular-devkit/core@0.4.6 @angular-devkit/schematics@0.4.6 @schematics/schematics@0.4.6 rxjs@5.5.5

yarn global add @angular/cli@1.6.2
yarn global add @delon/cli@1.0.0-beta.9

npm i -g @delon/cli@1.0.0-beta.9
ng set --global packageManager=yarn   // 反之，如果想换回 NPM，只需使用  ng set --global packageManager=npm

npm config set registry https://registry.npmjs.org/      //使用这个时，不报包不完整异常

npm link 方式
cd D:\nodejs\
git clone --depth=1 -b v1.6.2 https://github.com/angular/angular-cli.git
cd angular-cli
npm link

cd D:\nodejs\angular-cli>

//ng set defaults.schematics.collection @delon/cli --global
ng set defaults.schematics.collection @schematics/angular --global

ng new my-app  --skip-install  // 使用@delon/cli collection时 报 参数path只能是string异常
手动配置my-app项目下的.angular-cli.json文件
添加 
"schematics": {
   "collection": "@delon/cli"
}
结果如下
  "defaults": {
    "styleExt": "css",
    "component": {},
    "schematics": {
      "collection": "@delon/cli"
    }
  }
修改   package.json中的 "@angular/cli": "1.6.2",为"@angular/cli": "^1.6.2",（加^号）
结果如下
  "devDependencies": {
    "@angular/cli": "^1.6.2",
    "@angular/compiler-cli": "^5.0.0",
    ....
  }
"@delon/cli": "^0.8.1",修改为 "@delon/cli": "^1.0.0-beta.9",

结果如下
  "devDependencies": {
    "@angular/cli": "^1.6.2",
    "@angular/compiler-cli": "^5.2.0",
    "@angular/language-service": "^5.2.0",
    "@delon/cli": "^1.0.0-beta.9",
    ...
  }

yarn install
npm start    //需要能正常启动

进到 my-app文件夹中，保留 .angular-cli.json 和 node_modules ，其它全部删掉

npm install @delon/cli --save-dev
npm install @delon/cli@1.0.0-beta.9 --save-dev
npm install -g typescript typings

ng new -c=@delon/cli lonely

-----------------------------------------------------------------------------------------




<!-- npm install -g @angular-devkit/core@0.0.29    // yarn global add @angular-devkit/core@0.0.29 -->
<!-- npm install -g -f @angular/cli@1.6.2             // yarn global add @angular/cli@1.6.2 -->

ng set --global packageManager=yarn   // 反之，如果想换回 NPM，只需使用  ng set --global packageManager=npm

先决条件
```
npm install -g @angular-devkit/core@0.4.6 @angular-devkit/schematics@0.4.6 @schematics/schematics@0.4.6 rxjs@5.5.5
npm install -g @angular/cli@1.6.2  //安装失败
```

- 全局安装@delon/cli

```
npm install -g @delon/cli@1.0.0-beta.9

yarn global add @angular/cli@1.6.2
yarn global add @delon/cli@1.0.0-beta.9
ng new -c=@delon/cli my-app  --skip-install
ng new --c=@delon/cli my-app  --skip-install
```
可以进一步替换将 ng-alain 脚手架设置为默认项目模板：

ng set defaults.schematics.collection @delon/cli --global

或者还原为 Angular Cli 默认的：

ng set defaults.schematics.collection @schematics/angular --global

cd D:\nodejs\
git clone --depth=1 -b 1.0.0-beta.9 https://github.com/cipchk/delon.git
npm link    //失败

ng new -c=@delon/cli my-dream-app  --skip-install

-c=@delon/cli的作用估计是"collection": "@delon/cli"
然后设置 .angular-cli.json 的默认 collection：

"defaults": {
  "schematics": {
    "collection": "@delon/cli"
  }
}
cd my-dream-app

yarn install


# 参考
- @delon/cli https://ng-alain.com/docs/cli

- ng-alain https://ng-alain.com/docs/getting-started

- NG-ZORRO https://ng.ant.design/#/docs/angular/introduce

- Angular UI框架 Ng-alain @delon的脚手架的生成开发模板 https://www.cnblogs.com/wer-ltm/p/8447323.html

- AngularCLI命令速查表 https://www.jianshu.com/p/384cc631f0fa

- yarn 替代npm  https://blog.csdn.net/crper/article/details/62884688