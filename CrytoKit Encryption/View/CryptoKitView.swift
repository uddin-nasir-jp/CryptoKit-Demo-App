
import SwiftUI

struct CryptoKitView: View {
    @State private var userInput: String = ""
    var viewModel = CryptoViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Group {
                        TextField("Enter text to hash", text: $userInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button("Generate SHA256 Hash") {
                            viewModel.hashInputSHA256(input: userInput)
                        }
                        .buttonStyle(.borderedProminent)

                        if let hashResult = viewModel.dataModel.hashResultSHA256 {
                            Text("SHA256 Hash: \(hashResult)")
                                .padding()
                                .textSelection(.enabled)
                        }
                    }
                    Divider()
                    Group {
                        Button("Generate SHA512 Hash") {
                            viewModel.hashInputSHA512(input: userInput)
                        }
                        .buttonStyle(.borderedProminent)

                        if let hashResult = viewModel.dataModel.hashResultSHA512 {
                            Text("SHA512 Hash: \(hashResult)")
                                .padding()
                                .textSelection(.enabled)
                        }
                    }
                    Divider()
                    Group {
                        Button("Generate Symmetric Key") {
                            viewModel.generateSymmetricKey()
                        }
                        .buttonStyle(.bordered)

                        if let symmetricKey = viewModel.dataModel.symmetricKeyBase64 {
                            Text("Symmetric Key: \(symmetricKey)")
                                .padding()
                                .textSelection(.enabled)
                        }
                    }
                    Divider()
                    Group {
                        Button("Encrypt Message") {
                            viewModel.encryptMessage(userInput)
                        }
                        .buttonStyle(.bordered)
                        .disabled(userInput.isEmpty)
                        if let encryptedMessage = viewModel.dataModel.encryptedMessageBase64 {
                            Text("Encrypted Message: \(encryptedMessage)")
                                .padding()
                                .textSelection(.enabled)
                        }
                    }
                    Divider()
                    Group {
                        Button("Decrypt Message") {
                            viewModel.decryptMessage()
                        }
                        .buttonStyle(.bordered)
                        .disabled(viewModel.dataModel.encryptedMessageBase64 == nil)
                        if let decryptedMessage = viewModel.dataModel.decryptedMessage {
                            Text("Decrypted Message: \(decryptedMessage)")
                                .padding()
                                .textSelection(.enabled)
                        }
                    }
                    Divider()
                    Group {
                        Button("Generate Key Pair") {
                            viewModel.generateKeyPair()
                        }
                        .buttonStyle(.bordered)
                        if let publicKey = viewModel.dataModel.publicKeyBase64 {
                            Text("Public Key: \(publicKey)")
                                .padding()
                                .textSelection(.enabled)
                        }
                    }
                    Divider()
                    Group {
                        Button("Sign Message") {
                            viewModel.signMessage(userInput)
                        }
                        .buttonStyle(.bordered)
                        .disabled(userInput.isEmpty || viewModel.dataModel.privateKey == nil)
                        if let signature = viewModel.dataModel.signatureBase64 {
                            Text("Signature: \(signature)")
                                .padding()
                                .textSelection(.enabled)
                        }
                    }
                    Divider()
                    Group {
                        Button("Verify Signature") {
                            viewModel.verifySignature(userInput)
                        }
                        .buttonStyle(.bordered)
                        .disabled(viewModel.dataModel.signatureBase64 == nil || viewModel.dataModel.publicKey == nil)
                        Text(viewModel.dataModel.verificationResult)
                            .padding()
                    }
                }
                .navigationTitle("CryptoKit Demo")
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
