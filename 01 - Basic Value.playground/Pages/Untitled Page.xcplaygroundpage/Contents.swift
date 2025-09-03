
let intMin = Int.min
let intMax = Int.max
let doublMin = Double.leastNormalMagnitude
let doubleMax = Double.greatestFiniteMagnitude

print("Int min is \(intMin),\nInt max is \(intMax), \nDouble min is \(doublMin) \nand Double max is \(doubleMax).\nUInt и Float по той же схеме.\n")

print("""
Int min is \(intMin),
Int max is \(intMax),
Double min is \(doublMin)
and Double max is \(doubleMax).
UInt и Float по той же схеме.

""")

let first: Int = 10
let second: Float = 20
let third: Double = 30

let fourth: Int = first + Int(second) + Int(third)
let fifth: Float = Float(first) + second + Float(third)
let sixth: Double = Double(first) + Double(second) + third

let intSum = first + fourth
let doubleSumm = third + sixth

let equitable: Bool = intSum == Int(doubleSumm)
print(equitable)

