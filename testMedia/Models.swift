//
//  Models.swift
//  testMedia
//
//  Created by Pavel Scope on 19.04.2020.
//  Copyright © 2020 Paronkin Pavel. All rights reserved.
//

import Foundation

enum Type {
    case notice
    case event
    case move
}

protocol ModelTypeProtocol {
    var type: Type { get set }
}

//MARK: - Notice

struct Notice: ModelTypeProtocol {
    
    var type: Type = .notice
    
    var flightDate: Date?
    var gate: String?
    
    init(flightDate: Date?, gate: String?) {
        self.flightDate = flightDate
        self.gate = gate
    }
}

//MARK: - Event

class Event: ModelTypeProtocol {
    
    var type: Type = .event
    
    var startTime: Date?
    var endTime: Date?
    var name: String!
    
    init(startTime: Date?, endTime: Date?, name: String!) {
        self.startTime = startTime
        self.endTime = endTime
        self.name = name
    }
}

//MARK: - Move

class Move: ModelTypeProtocol {
    
    var type: Type = .move
    
    var fromPlace: String?
    var toPlace: String?
    var estimateTime: TimeInterval?
    
    init(fromPlace: String?, toPlace: String?, estimateTime: TimeInterval?) {
        self.fromPlace = fromPlace
        self.toPlace = toPlace
        self.estimateTime = estimateTime
    }
}


let gates = ["Терминал А", "Терминал Б", "Терминал В"]

let places = ["Амстердам","Антверпен","Афины","Барселона","Берлин","Брюгге","Варшава","Вашингтон","Вена","Венеция","Гагра","Гамбург","Геленджик","Дрезден","Дубай","Дубровник","Евпатория","Ейск","Екатеринбург","Женева","Загреб","Иерусалим","Ижевск","Иркутск","Йошкар-Ола","Казань","Кёльн","Киев","Лас-Вегас","Лондон","Лос-Анджелес","Мадрид","Милан","Минск","Москва","Мюнхен","Неаполь","Нижний Новгород","Новосибирск","Нью-Йорк","Одесса","Омск","Осло","Париж","Пекин","Прага","Рим","Рио-де-Жанейро","Ростов-на-Дону","Санкт-Петербург","Севастополь","София","Сочи","Таллин","Тбилиси","Тель-Авив","Ульяновск","Уфа","Филадельфия","Флоренция","Хайфа","Ханой","Харьков","Хельсинки","Хошимин","Цюрих","Чебоксары","Челябинск","Чикаго","Шанхай","Штутгарт","Щецин","Эйлат","Эйндховен","Юрмала","Якутск","Ялта","Ярославль"]

let events = ["Кино", "Музей", "Концерт"]


final class ModelGenerator {
    
    static func generateMove() -> Move {
        let firstPlacePoint = Int.random(in: 0...78)
        var firstPlace: String?
        
        let secondPlacePoint = Int.random(in: 0...78)
        var secondPlace: String?
        
        if let place = places[safe: firstPlacePoint] {
            firstPlace = place
        }
        
        if let place = places[safe: secondPlacePoint] {
            secondPlace = place
        }
        
        let estimateTime = Date().timeIntervalSinceNow
        
        return Move(fromPlace: firstPlace, toPlace: secondPlace, estimateTime: estimateTime)
    }
    
    static func generateEvent() -> Event {
        
        var startTime: Date?
        var endTime: Date?
        var name: String = ""
        
        if let eventName = events[safe: Int.random(in: 0...2)] {
            name = eventName
        }
        
        startTime = generateDate()
        
        let newTime = generateDate()
        
        if let start = startTime?.toInt() {
            if newTime.toInt() > start {
                endTime = newTime
            }
        }
        
        return Event(startTime: startTime, endTime: endTime, name: name)
    }
    
    static func generateNotice() -> Notice {
        
        let flightDate = generateDate()
        var gate: String?
        if let exit = gates[safe: Int.random(in: 0...2)] {
            gate = exit
        }
        return Notice(flightDate: flightDate, gate: gate)
    }
    
    
    private static func generateDate() -> Date {
        let timeInterval = TimeInterval.random(in: 1000...100000)
        return Date.init(timeInterval: timeInterval, since: Date())
    }
    
}
