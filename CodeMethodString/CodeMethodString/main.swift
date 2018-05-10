//
//  main.swift
//  CodeMethodString
//
//  Created by wumeng on 2017/11/29.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import Foundation

print("Hello, World!")
let url = "http://integral.xckoo.com/getUICode"
let method = codeMethodStr2(str: url)
print(method)



let md5str =  "3D:27:A2:AA:F9:5B:47:DA:45:A9:4E:8A:AB:1B:68:4C"
let result = MD5ToStr(str: md5str)
print("result ：" + result.lowercased())



/*
 NSString *methodStr = Obfuscate.c.o.n.t.a.i.n.e.r.W.i.t.h.I.d.e.n.t.i.f.i.e.r.colon.e.r.r.o.r.colon;
 SEL sel = NSSelectorFromString(methodStr);
 */



