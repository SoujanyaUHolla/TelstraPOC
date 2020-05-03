

import Foundation

struct MainInfo: Decodable {
    let title: String
    let rows: [InfoModel]
    
 init(title: String, rows:[InfoModel]){
    self.title = title
    self.rows = rows.filter{$0.title != nil}
 }
}
