//
//  AuthService.swift
//  Seminar-6th
//
//  Created by 초이 on 2020/11/21.
//

//로그인 서버 통신 구현을 위한 구조체

import Foundation
import Alamofire

struct AuthService { //파일 이름과 동일하게
    //싱글톤 디자인패턴 이용
    //싱글톤 객체 - 앱 어디서든 접근 가능
    static let shared = AuthService()
    
    //closure를 함수의 파라미터로 받음
    //@escaping - 탈출 클로저
    func signIn(email: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.usersSignInURL
        let header: HTTPHeaders = [ //swift 딕셔너리형
            "Content-Type":"application/json"
        ]
        let body: Parameters = [
            "email": email,
            "password":password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData{ (response) in
            //통신 결과에 대한 분기 처리
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                completion(judgeSignInData(status: statusCode, data: data))
                
            case .failure(let err): print(err)
                completion(.networkFail) }
        }
    }
    
    private func judgeSignInData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignInData>.self, from: data) else {
            return .pathErr
        }
        
        switch status {
            case 200:
                return .success(decodedData.data)
            case 400..<500:
                return .requestErr(decodedData.message)
            case 500:
                return .serverErr
            default:
                return .networkFail }
    }
    
}
