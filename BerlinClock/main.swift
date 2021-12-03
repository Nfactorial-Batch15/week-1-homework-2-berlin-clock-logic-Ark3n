//
//  main.swift
//  BerlinClock
//
//  Created by Arken Sarsenov on 03.12.2021.
//

import Foundation

//            1S  5H   1H     5M(11)   1M
// 00:00:00    Y OOOO OOOO OOOOOOOOOOO OOOO
// 23:59:59    O RRRR RRRO YYRYYRYYRYY YYYY
// 16:50:06    Y RRRO ROOO YYRYYRYYRY0 0000
// 11:37:01    O RR00 R000 YYRYYRYOOOO YY00

print("Enter hours:")
let inputHours = Int(readLine()!)!

print("Enter minutes:")
let inputMinutes = Int(readLine()!)!

print("Enter seconds:")
let inputSeconds = Int(readLine()!)!



func secondsRaw(seconds: Int) -> String {
    seconds % 2 == 0 ? "Y" : "O"
}

func fiveHoursRaw(hour: Int) -> String {
    calcLights(lighs: 4, devide: hour / 5)
}

func oneHourRow(hour: Int) ->String {
    calcLights(lighs: 4, devide: hour % 5)
}

func fiveMinutesRow(minutes: Int) -> String {
    calcLights(lighs: 11, devide: minutes / 5)
}

func oneMinutesRow(minutes: Int) -> String {
    calcLights(lighs: 4, devide: minutes % 5)
}

func calcLights(lighs: Int, devide: Int) -> String{
    let intOff = lighs - devide
    var onLights = ""
    if devide > 0 {
        for _ in 1...devide {
            onLights += "R"
        }
    }
    var offLights = ""
    if  intOff > 0 {
        for _ in 1...intOff{
            offLights += "O"
        }
    }
    return onLights + offLights
}

print(secondsRaw(seconds: inputSeconds), fiveHoursRaw(hour: inputHours), oneHourRow(hour: inputHours), fiveMinutesRow(minutes: inputMinutes), oneMinutesRow(minutes: inputMinutes))

