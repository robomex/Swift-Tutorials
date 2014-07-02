// TreeHouse's Absolute Beginner's Guide to Swift

let languageName = "Swift" // inferred as String

var version = 1.0 // inferred as Double

let introduced = 2014 // inferred as Int

let isAwesome = true // inferred as Bool

let title = "An Absolute Beginner's Guide to Swift"
let review = "Is Awesome!"
let description = title + " - " + review
// description = "An Absolute Beginner's Guide to Swift - Is Awesome!"

let datePublished = "June 9th, 2014"
let postMeta = "Blog Post published on: \(datePublished)"
// postmeta = "Blog Post published on: June 9th, 2014"

var cardNames = ["Jack", "Queen", "King"] // inferred as String[]

println(cardNames[1])

var todo = ["Write Blog", "Return Call"]
todo += "Get Groceries"
todo += ["Send Email", "Pickup Laundry"]
todo[0] = "Proofread Blog Post"
todo[2..5] = ["Pickup Laundry", "Get Groceries", "Cook Dinner"]

var cards = ["Jack" : 11, "Queen" : 12, "King" : 13]
cards["Ace"] = 15
cards["Ace"] = 1
println(cards["Ace"])

for var i = 1; i < cardNames.count; ++i {
    println(cardNames[i])
}

for (cardName, cardValue) in cards {
    println("\(cardName) = \(cardValue)")
}

var distance = 99
switch distance {
    case 0:
        println("not a valid distance")
    case 1..10:
        println("near")
    case 10..100:
        println("far")
    default:
        println("too far")
}

func buildCard(cardName: String, cardValue: Int) -> String {
    return "\(cardName) = \(cardValue)"
}

buildCard("Jack", 11)


// Ray Wenderlich's Swift Tutorial: A Quick Start

