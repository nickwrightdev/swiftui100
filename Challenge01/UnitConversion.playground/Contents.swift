import UIKit

enum TemperatureType {
    case celsius
    case fahrenheit
    case kelvin
}

// temperature conversion
func convert(_ amount: Double, from inputType: TemperatureType, to outputType: TemperatureType) -> Double {
    var baseAmount = amount
    if inputType == .fahrenheit {
        baseAmount = (amount - 32)  * (5 / 9)
    } else if inputType == .kelvin {
        baseAmount = amount - 273.15
    }
    
    var retAmount = baseAmount
    if outputType == .fahrenheit {
        retAmount = baseAmount * (9 / 5) + 32
    } else if outputType == .kelvin {
        retAmount = baseAmount + 273.15
    }
    return retAmount
}

let ftoc = convert(100, from: .fahrenheit, to: .celsius)
let ftok = convert(100, from: .fahrenheit, to: .kelvin)

let ctof = convert(100, from: .celsius, to: .fahrenheit)
let ctok = convert(100, from: .celsius, to: .kelvin)

let ktoc = convert(100, from: .kelvin, to: .celsius)
let ktof = convert(100, from: .kelvin, to: .fahrenheit)

print("\(ftoc)")
print("\(ftok)")
print("\(ctof)")
print("\(ctok)")
print("\(ktoc)")
print("\(ktof)")

// Swift provided unit conversion.. no need to reinvent the wheel
let far = Measurement(value: 100, unit: UnitTemperature.fahrenheit)
let cel = far.converted(to: .celsius)
print("\(far.value) F is \(cel.value) C")

