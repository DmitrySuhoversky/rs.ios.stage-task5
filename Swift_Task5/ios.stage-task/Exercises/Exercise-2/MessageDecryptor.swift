import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
      
        var mutableMessage = message
        var result: String = ""
                
        while mutableMessage.count > 0 {
            
            var i = String(mutableMessage.prefix(while: {$0 != "["}))
            if let multiplier = Int(i) {
                
                let firstRange = mutableMessage.range(of: i)
                mutableMessage = mutableMessage.replacingCharacters(in: firstRange!, with: "")
                        
                let subMessage = SubMessage(of: mutableMessage)
                let decryprted = decryptMessage(subMessage)
                        
                result.append(String(repeating: decryprted, count: multiplier))
                        
                let secondRange = mutableMessage.range(of: subMessage)
                mutableMessage = mutableMessage.replacingCharacters(in: secondRange!, with: "")
                } else {
                
                i = String(mutableMessage.first!)
                if i != "]" && i != "[" {
                    result.append(i)
                }
                mutableMessage = String(mutableMessage.dropFirst())
            }
        }
                
        return result
    }
    
    private func SubMessage(of message: String) -> String {
         
         var subMessage = ""
         var c = 0
         
         for char in message {
            subMessage.append(char)
            if char != "]" {
            if char == "[" {
            c += 1 }
            } else {
                c -= 1
                if c == 0 {
                    break
                }
            }
        }
        return subMessage
    }
}
