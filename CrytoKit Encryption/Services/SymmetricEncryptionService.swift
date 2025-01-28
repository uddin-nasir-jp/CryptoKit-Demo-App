import CryptoKit
import SwiftUI

// Service for symmetric encryption and decryption using AES-GCM.
class SymmetricEncryptionService: SymmetricEncryptionServiceProtocol {
    func generateSymmetricKey() -> SymmetricKey {
        return SymmetricKey(size: .bits256)
    }

    func encrypt(message: String, using key: SymmetricKey) -> String? {
        let messageData = Data(message.utf8)
        do {
            let sealedBox = try AES.GCM.seal(messageData, using: key)
            return sealedBox.combined?.base64EncodedString()
        } catch {
            return nil
        }
    }

    func decrypt(encryptedMessage: String, using key: SymmetricKey) -> String? {
        guard let encryptedData = Data(base64Encoded: encryptedMessage) else { return nil }
        do {
            let sealedBox = try AES.GCM.SealedBox(combined: encryptedData)
            let decryptedData = try AES.GCM.open(sealedBox, using: key)
            return String(data: decryptedData, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
