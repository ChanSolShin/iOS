//
//  Rsp.swift
//  rsp
//
//  Created by 신찬솔 on 2023/12/30.
//

import Foundation

enum Rsp: Int {
    case rock
    case sisers
    case papers
    var imageName: String {
            switch self {
            case .rock:
                return "rock" // "rock_image_name"에는 실제 이미지 파일의 이름이 들어가야 합니다.
            case .sisers:
                return "sisers" // "sisers_image_name"에는 실제 이미지 파일의 이름이 들어가야 합니다.
            case .papers:
                return "paper" // "papers_image_name"에는 실제 이미지 파일의 이름이 들어가야 합니다.
            }
        }
}

