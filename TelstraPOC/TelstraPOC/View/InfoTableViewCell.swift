//
//  InfoTableViewCell.swift
//  TelstraPOC
//
//  Created by Soujanya on 01/05/20.
//  Copyright © 2020 Soujanya. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

        let infoImageView:UIImageView = {
            let img = UIImageView()
            img.image = #imageLiteral(resourceName: "placeholder")
            img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
            img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
            img.clipsToBounds = true
            return img
        }()
        
        let infoNameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let infoDetailedLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textColor =  .black
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    
    func loadCellContents(news:InfoModel){
        self.infoNameLabel.text = news.title
        self.infoDetailedLabel.text = news.description
        self.infoImageView.imagedownlaodedFromURL(news.imageHref ?? "", placeHolder: #imageLiteral(resourceName: "placeholder"))
        
    }
        

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            self.contentView.addSubview(infoImageView)
            self.contentView.addSubview(infoNameLabel)
            self.contentView.addSubview(infoDetailedLabel)
            
            infoImageView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:4).isActive = true
            infoImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor,constant: 10).isActive = true
            infoImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
            infoImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
            
            
            infoNameLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:90).isActive = true
            infoNameLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
            
           infoDetailedLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
            infoDetailedLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:30).isActive = true
           infoDetailedLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:90).isActive = true
           infoDetailedLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
            infoDetailedLabel.heightAnchor.constraint(greaterThanOrEqualToConstant:10).isActive = true

            
            
        }
        
        required init?(coder aDecoder: NSCoder) {

            super.init(coder: aDecoder)
        }


}



