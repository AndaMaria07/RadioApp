//
//  RadioStationCell.swift
//  Radio
//
//  Created by Anda on 5.06.2024.
//

import UIKit

class RadioStationCell: UITableViewCell {
    
    var rsImageView = UIImageView()
    var rsRadioName = UILabel()
    var rsLanguage = UILabel()
    var rsTags = UILabel()
    var rsPlayButton = UIButton()
    var currentRadioStation : RadioStation?
    weak var playRadioButtonDelegate: PlayRadioButtonDelegate?
    
    var rsLanguageIcon = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(rsImageView)
        addSubview(rsRadioName)
        addSubview(rsLanguage)
        addSubview(rsTags)
        addSubview(rsLanguageIcon)
        contentView.addSubview(rsPlayButton)
        
        selectionStyle = .none
        
        configureSubviewProperties()
        componentConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getImageFromURL(url: URL) {
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    self?.imageView?.image = UIImage(data: data)
                }
            }
        }
        
        dataTask.resume()
    }
    
    func configure() {
        guard let currentRadioStation = currentRadioStation else { return }
        rsRadioName.text = currentRadioStation.name
        
        // Language info handling
        if currentRadioStation.language == "" {
            rsLanguage.text = "N/A"
        } else {
            
            let trimmedLanguage = currentRadioStation.language?.trimAfterComma()
            rsLanguage.text = trimmedLanguage?.capitalized
        }
        
        // Tag info handling
        
        let modifiedTag = currentRadioStation.tags?.whitespaceAfterComma()
        rsTags.text = modifiedTag
        
        // Image handling
        fetchImage(url: currentRadioStation.favicon) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async { [weak self]
                in
                guard let self = self else { return }
                self.rsImageView.image = image
            }
        }
        
        // Button handling
        rsPlayButton.addTarget(self, action: #selector(callDelegate), for: .touchUpInside)
        
    }
    
    @objc func callDelegate() {
        guard let currentRadioStation = currentRadioStation else { return }
        playRadioButtonDelegate?.didTapRSPlayButton(name: currentRadioStation.name, url: currentRadioStation.urlResolved, favicon: currentRadioStation.favicon)
    }
    
    func configureSubviewProperties() {
        
        // Image
        rsImageView.translatesAutoresizingMaskIntoConstraints = false
        rsImageView.layer.cornerRadius = 10
        rsImageView.clipsToBounds = true
        rsImageView.image = UIImage(named: "radio")
        
        
        // Name
        rsRadioName.translatesAutoresizingMaskIntoConstraints = false
        rsRadioName.numberOfLines = 0
        rsRadioName.adjustsFontSizeToFitWidth = true
        rsRadioName.text = "Best FM"
        rsRadioName.textAlignment = .left
        rsRadioName.numberOfLines = 1
        
        // Language
        rsLanguage.translatesAutoresizingMaskIntoConstraints = false
        rsLanguage.text = "german, english"
        rsLanguage.textAlignment = .center
        rsLanguage.numberOfLines = 0
        rsLanguage.lineBreakStrategy = .standard
        
        
        // Tags
        rsTags.translatesAutoresizingMaskIntoConstraints = false
        rsTags.text = "jazz,pop,rock,indie"
        rsTags.textAlignment = .left
        rsTags.numberOfLines = 0
        rsTags.lineBreakStrategy = .standard
        
        // PlayButton
        rsPlayButton.translatesAutoresizingMaskIntoConstraints = false
        rsPlayButton.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        
        // Language Icon
        rsLanguageIcon.translatesAutoresizingMaskIntoConstraints = false
        rsLanguageIcon.image = UIImage(named: "message.and.waveform")
    }
    
    func componentConstraints() {
        let padding: CGFloat = 6
        let buttonSize: CGFloat = 80

        NSLayoutConstraint.activate([
            rsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            rsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            rsImageView.heightAnchor.constraint(equalToConstant: 120),
            rsImageView.widthAnchor.constraint(equalToConstant: 120),
            
            rsRadioName.leadingAnchor.constraint(equalTo: rsImageView.trailingAnchor, constant: 18),
            rsRadioName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            rsRadioName.topAnchor.constraint(equalTo: rsImageView.topAnchor),
            
            rsLanguage.leadingAnchor.constraint(equalTo: rsImageView.leadingAnchor),
            rsLanguage.topAnchor.constraint(equalTo: rsImageView.bottomAnchor, constant: padding),
            rsLanguage.trailingAnchor.constraint(equalTo: rsImageView.trailingAnchor),
            
            rsTags.leadingAnchor.constraint(equalTo: rsImageView.trailingAnchor, constant: 18),
            rsTags.topAnchor.constraint(equalTo: rsRadioName.bottomAnchor, constant: padding),
            rsTags.trailingAnchor.constraint(equalTo: rsPlayButton.leadingAnchor, constant: -padding),
            
            rsPlayButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            rsPlayButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            rsPlayButton.widthAnchor.constraint(equalToConstant: buttonSize),
            rsPlayButton.heightAnchor.constraint(equalToConstant: buttonSize),
            
            rsLanguageIcon.topAnchor.constraint(equalTo: rsLanguage.bottomAnchor),
            rsLanguageIcon.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        rsImageView.image = nil
    }
    
    private func fetchImage(url: String, completion: @escaping (UIImage?) -> ())  {
        
        guard let url = URL(string: url) else {
            completion(UIImage(named: "radio"))
            return
        }
        
        let getDataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                completion(UIImage(named: "radio"))
                return
            }
           
            completion(UIImage(data: data))

        }
        
        getDataTask.resume()
    }
}
