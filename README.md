# gensuit201902
代码生成器
跨站脚本攻击过滤 (java版本) https://github.com/AI-OPT/opt-xss-filter

        <dependency>
            <groupId>org.owasp.antisamy</groupId>
            <artifactId>antisamy</artifactId>
            <version>1.5.8</version>
        </dependency>
        
XSS总结 多种情况 https://xz.aliyun.com/t/4067
https://www.cnblogs.com/linuxsec/articles/7821009.html

<img src=1 onerror=alert("xss");>

//        & < > " ' /
//        str = str.replaceAll("&quot;", "\"");
//        str = str.replaceAll("&amp;", "&");
//        str = str.replaceAll("'", "'");
//        str = str.replaceAll ("'", "＇");

在 HTML 中内嵌的文本中，恶意内容以 script 标签形成注入。

在内联的 JavaScript 中，拼接的数据突破了原本的限制（字符串，变量，方法名等）。

在标签属性中，恶意内容包含引号，从而突破属性值的限制，注入其他属性或者标签。

在标签的 href、src 等属性中，包含 javascript: 等可执行代码。

在 onload、onerror、onclick 等事件中，注入不受控制代码。

在 style 属性和标签中，包含类似 background-image:url("javascript:..."); 的代码（新版本浏览器已经可以防范）。

在 style 属性和标签中，包含类似 expression(...) 的 CSS 表达式代码（新版本浏览器已经可以防范）。