
import CryptoKit

struct CryptoDataModel {
    var hashResultSHA256: String?
    var hashResultSHA512: String?
    var symmetricKeyBase64: String?
    var encryptedMessageBase64: String?
    var decryptedMessage: String?
    var publicKeyBase64: String?
    var signatureBase64: String?
    var verificationResult: String = ""
    var symmetricKey: SymmetricKey?
    var privateKey: Curve25519.Signing.PrivateKey?
    var publicKey: Curve25519.Signing.PublicKey?
}
