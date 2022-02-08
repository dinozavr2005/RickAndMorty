//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Владимир on 07.02.2022.
//

import UIKit

class EpisodesViewController: UITableViewController {
    
    private var button: UIButton?
    private var episodes = [Episode]()
    private var seasons = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getEpisodes()
    }
    
    private func getEpisodes(){
        NetworkManager.shared.getEpisodes(name: nil) { [weak self] (episodes) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.episodes = episodes
                let episodesSeason = self.episodes.map({ String($0.episode.dropLast(3)) })
                self.seasons = Array(Set(episodesSeason)).sorted()
                self.tableView.reloadData()
            }
        }
    }
    
}

extension EpisodesViewController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") {
            //header.label.text = "Season \(self.seasons[section].dropFirst(2))"
            tableView.tableHeaderView?.layer.name = "Season \(self.seasons[section].dropFirst(2))"
            return header
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 54.5
        default:
            return 74.0
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        var countSeasons = 0
        var prevSeason = ""
        self.episodes.forEach({
            if (String($0.episode.dropLast(3)) != prevSeason) {
                prevSeason = String($0.episode.dropLast(3))
                countSeasons += 1
            }
        })
        return countSeasons
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.episodes.filter({ $0.episode.contains(self.seasons[section]) }).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Episode", for: indexPath) as? EpisodeCell {
            let seasonEpisodes = self.episodes.filter({ $0.episode.contains(self.seasons[indexPath.section]) })
            cell.selectionStyle = .none
            cell.label.text = seasonEpisodes[indexPath.row].episode
            cell.subLabel.text = seasonEpisodes[indexPath.row].name
            cell.dateLabel.text = seasonEpisodes[indexPath.row].airDate.uppercased()

            return cell
    }
        return UITableViewCell()
    }

}
