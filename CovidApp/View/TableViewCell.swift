//
//  TableViewCell.swift
//  CovidApp
//
//  Created by Tunahan on 12/5/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
