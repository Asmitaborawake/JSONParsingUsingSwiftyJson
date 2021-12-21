//
//  TableViewCell.swift
//  JsonParseUsingSwiftyJSONDemo
//
//  Created by Asmita Borawake on 20/12/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackCenseredName: UILabel!
    @IBOutlet weak var artWorkImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
