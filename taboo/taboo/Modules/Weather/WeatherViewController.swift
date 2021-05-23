//
//  WeatherViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/19/21.
//  
//

import UIKit
import CoreLocation

final class WeatherViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: WeatherPresentation?
    var moviesModuleBuilder: MoviesModuleBuilder?
    var city: String?
    var response: WeatherCellViewModel?
    var const = 0
    
    // MARK: - Private properties
    private lazy var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.image = Asset.weatherBackground.image
        image.contentMode = .scaleAspectFill
        return image
    }()
    private lazy var conditionImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "sun.max")
        image.tintColor = Asset.weatherColor.color
        return image
    }()
    
    private lazy var temperatureLabel: UILabel = {
       let label = UILabel()
        label.text = "21.3°C"
        label.font = FontFamily.SFProDisplay.bold.font(size: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
       let label = UILabel()
        label.text = "Almaty"
        label.font = FontFamily.SFProDisplay.regular.font(size: 30)
        return label
    }()
    
    private lazy var searchTextField: MainTextField = {
        let textField = MainTextField(style: .regular)
        textField.placeholder = "Введите город"
        textField.textAlignment = .left
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.backgroundColor = UIColor.clear
        textField.font = FontFamily.SFProDisplay.regular.font(size: 25)
        textField.layer.borderColor = Color.lightGray.cgColor
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = Asset.weatherColor.color
        button.imageView?.contentMode = .scaleToFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(WeatherCell.self, forCellReuseIdentifier: "weatherCell")
        view.separatorStyle = .none
        view.backgroundColor = UIColor.clear
        view.showsVerticalScrollIndicator = false
//        view.allowsSelection = false
        view.isScrollEnabled = false
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.text = "Рекомендация дня в \(city ?? "Almaty")"
        label.font = FontFamily.SFProDisplay.regular.font(size: 26)
        label.numberOfLines = 2
        label.textColor = Asset.weatherColor.color
        return label
    }()
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        tableView.backgroundColor = UIColor.clear
        weatherManager.delegate = self
        searchTextField.delegate = self
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubviews(backgroundImage,
                         searchTextField,
                         searchButton,
                         conditionImageView,
                         temperatureLabel,
                         cityLabel, infoLabel, tableView)
    }
    
    private func configureConstraints() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.height.equalTo(40)
            $0.leading.equalToSuperview().offset(30)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.top)
            $0.width.height.equalTo(40)
            $0.leading.equalTo(searchTextField.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        conditionImageView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(120)
            $0.height.equalTo(110)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(conditionImageView.snp.bottom)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(100)
        }
        
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        tableView.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.width.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(infoLabel.snp.bottom).offset(30)
            $0.height.equalTo(110)
            $0.bottom.equalToSuperview().offset(-50)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension WeatherViewController: WeatherView {
}

// MARK: - Nested types

private extension WeatherViewController {
    
    enum Constants {
    }
    
}

extension WeatherViewController: UITextFieldDelegate {
    
    @objc private func searchTapped() {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Введите город"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        WeatherManager.featuredMovies { (response) -> () in
            self.const = 1
            self.response = response.first
            self.tableView.reloadData()
        }
        
        searchTextField.text = ""
        
    }
}

//MARK: - WeatherManagerDelegate


extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = "\(weather.temperatureString)°C"
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            self.city = weather.cityName
            self.infoLabel.text = "Рекомендация дня в \(self.city ?? "Almaty")"
        }
    }
    
    func didFailWithError(error: Error) {
    }
}

//MARK: - CLLocationManagerDelegate


extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        if const == 1 {
            cell.configure(with: response ?? WeatherCellViewModel())
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = MovieCardViewController()
        present(vc, animated: true, completion: nil)
    }
    
    
}
