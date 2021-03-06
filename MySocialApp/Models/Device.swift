import Foundation

public class Device: JSONable {
    
    public static let IOS = "IOS"

    public var appPlatform: String?{
        get { return (super.getAttributeInstance("app_platform") as! JSONableString?)?.string }
        set(appPlatform) { super.setStringAttribute(withName: "app_platform", appPlatform) }
    }
    public var pushKey: String?{
        get { return (super.getAttributeInstance("push_key") as! JSONableString?)?.string }
        set(pushKey) { super.setStringAttribute(withName: "push_key", pushKey) }
    }
    public var deviceId: String?{
        get { return (super.getAttributeInstance("device_id") as! JSONableString?)?.string }
        set(deviceId) { super.setStringAttribute(withName: "device_id", deviceId) }
    }
    
    internal override func getAttributeCreationMethod(name: String) -> CreationMethod {
        switch name {
        case "app_platform", "push_key", "device_id":
            return JSONableString().initAttributes
        default:
            return super.getAttributeCreationMethod(name: name)
        }
    }
    
    public required init() {
        super.init()
    }
    
    public init(appPlatform: String = Device.IOS, pushKey: String, deviceId: String) {
        super.init()
        self.appPlatform = appPlatform
        self.pushKey = pushKey
        self.deviceId = deviceId
    }
}
