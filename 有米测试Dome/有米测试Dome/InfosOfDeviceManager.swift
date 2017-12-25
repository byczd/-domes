//
//  InfosOfDeviceManager.swift
//  有米测试Dome
//
//  Created by wumeng on 2017/12/12.
//  Copyright © 2017年 wumeng. All rights reserved.
//
//  X :没有任何意思，只是避免私有API检测被拒

import UIKit
import AdSupport
import CoreTelephony

class InfosOfDeviceManager: NSObject {
    func getInfo() -> ([String:Any]) {
        var returnInfos:[String:Any] = [:]
        
        let mac = getXMAC()
        returnInfos.updateValue(mac, forKey: "mac")
        
        let adId = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        returnInfos.updateValue(adId, forKey: "adId")
        
        let ifa_tracking = ASIdentifierManager.shared().isAdvertisingTrackingEnabled
        returnInfos.updateValue(ifa_tracking, forKey: "ifa_tracking")
        
        let openudid = OpenUDID.value() ?? "00"
        returnInfos.updateValue(openudid, forKey: "openudid")
        
        let dv = UIDevice.current.model
        returnInfos.updateValue(dv, forKey: "dv")
        
        let dd = getModelName()
        returnInfos.updateValue(dd, forKey: "dd")
        
        let osv = UIDevice.current.systemVersion
        returnInfos.updateValue(osv, forKey: "osv")
        
        let jb = AppInfo.myIap_isJailbroken()
        returnInfos.updateValue(jb, forKey: "jb")
        
        let nt = getNetStatus()
        returnInfos.updateValue(nt, forKey: "nt")
        
        let local = NSLocale.current.identifier
        returnInfos.updateValue(local, forKey: "local")
        
        let ip = IPInfosManager().getIPAddress(true) ?? ""
        returnInfos.updateValue(ip, forKey: "ip")
        
        let osifa = SimulateIDFA.createSimulateIDFA() ?? ""
        returnInfos.updateValue(osifa, forKey: "osifa")
        
        return returnInfos
    }
}

extension InfosOfDeviceManager {

    fileprivate func getModelName()->(String){
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    

    fileprivate func getXMAC() -> (String) {
        return "02:00:00:00:00:00"
    }
    
    fileprivate func getNetStatus()->(String){
        let reachability = Reachability(hostName: "www.apple.com")
        let internetsStatus = reachability?.currentReachabilityStatus() ?? NetworkStatus(rawValue: 0)
        switch internetsStatus {
        case NotReachable:
            return "notNt"
        case ReachableViaWiFi:
            return "wifi"
        case ReachableViaWWAN:
            return getWWANCase()
        default:
            return "notNt"
        }
        
    }
    
    private func getWWANCase()->(String){
        let info = CTTelephonyNetworkInfo()
        let currentStatus = info.currentRadioAccessTechnology ?? " "
        switch currentStatus {
        case CTRadioAccessTechnologyGPRS:
            return "GPRS"
        case CTRadioAccessTechnologyEdge:
            return "2.75G EDGE"
        case CTRadioAccessTechnologyWCDMA:
            return "3G"
        case CTRadioAccessTechnologyHSDPA:
            return "3.5G HSDPA"
        case CTRadioAccessTechnologyHSUPA:
            return "3.5G HSUPA"
        case CTRadioAccessTechnologyCDMA1x:
            return "2G"
        case CTRadioAccessTechnologyCDMAEVDORev0,CTRadioAccessTechnologyCDMAEVDORevA,CTRadioAccessTechnologyCDMAEVDORevB:
            return "3G"
        case CTRadioAccessTechnologyeHRPD:
            return "HRPD"
        case CTRadioAccessTechnologyLTE:
            return "4G"
        default:
            return " "
        }
    }
}



