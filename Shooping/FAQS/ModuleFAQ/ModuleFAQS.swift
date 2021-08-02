//
//  File.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 04/07/2021.
//

import Foundation

struct FAQSModule : Decodable {
    var status: Bool?
   // let message: nill
    var data: InfoData?
}
struct InfoData : Decodable {
    var current_page: Int?
    var data: [ALLData]?
    var first_page_url: String?
    var from, last_page: Int?
    var last_page_url: String?
    var path: String?
    var per_page: Int?
    var to, total: Int?
}
struct ALLData : Decodable {
    var id: Int?
    var question, answer: String?
}
