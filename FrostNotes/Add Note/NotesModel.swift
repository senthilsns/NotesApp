//
//  NotesModel.swift
//  FrostNotes
//
//  Created by K, Senthil Kumar EX1 on 11/04/21.
//

import Foundation

class NotesModel {

    var title : String?
    var description : String?
    var tag : String?

    init(title : String?, description : String?, tag : String?) {
        self.title = title
        self.description = description
        self.tag = tag
    }


}
