import Alamofire

struct RequestConfig {
    private let baseURL = "https://empresas.ioasys.com.br"
    private let api = "/api"
    private let version = "/v1"
    
    var accessToken: String = ""
    var client: String = ""
    var uid: String = ""
    
    func makeHeaders() -> HTTPHeaders {
        let headers = [
            HTTPHeader(name: "access-token", value: accessToken),
            HTTPHeader(name: "client", value: client),
            HTTPHeader(name: "uid", value: uid)
        ]
        return HTTPHeaders(headers)
    }
    
    func postSignIn() -> String {
        return baseURL + api + version + "/users/auth/sign_in"
    }
    
    func getEnterprises() -> String {
        return baseURL + api + version + "/enterprises"
    }
    
    func makeImageURL(imagePath: String) -> URL? {
        return URL(string: baseURL + imagePath)
    }
    
    mutating func updateRequestConfig(accessToken: String, client: String, uid: String) {
        self.accessToken = accessToken
        self.client = client
        self.uid =  uid
    }
}
