//
//  CollectionTableViewCell.swift
//  CollectionTableView
//
//  Created by Junseo Park on 2022/08/18.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    static let identifier = "CollectionTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        <#code#>
    }
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
