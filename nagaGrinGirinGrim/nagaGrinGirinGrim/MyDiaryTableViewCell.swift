//
//  TableViewCell.swift
//  nagaGrinGirinGrim
//
//  Created by 남보경 on 2023/08/16.
//

import UIKit

class MyDiaryTableViewCell: UITableViewCell {


    @IBOutlet weak var cellCard: UIView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    
    // Cell 간격 조정
    override func layoutSubviews() {
        super.layoutSubviews()
           
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
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
