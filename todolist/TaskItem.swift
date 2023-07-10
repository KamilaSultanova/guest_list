//
//  TaskItem.swift
//  todolist
//
//  Created by Kamila Sultanova on 06.07.2023.
//

import Foundation


struct TaskItem: Codable{
    var name : String?
    var surname : String?
    var isComplete: Bool = false
    
    enum CodingKeys: String, CodingKey {
            case name
            case surname
        }
}
