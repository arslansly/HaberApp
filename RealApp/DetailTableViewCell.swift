//
//  DetailTableViewCell.swift
//  RealApp
//
//  Created by Süleyman Arslan on 5.12.2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var yorum: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
