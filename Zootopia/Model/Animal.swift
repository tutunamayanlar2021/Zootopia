//
//  Animal.swift
//  Zootopia
//
//  Created by Kader Oral on 16.07.2023.
//

import UIKit

struct Animal {
    let image: UIImage
    let name: String
    let url: String
}

let animals: [Animal] = [
    Animal(image: #imageLiteral(resourceName: "hippo"), name: "hippo", url: "https://en.wikipedia.org/wiki/Hippopotamus"),
    Animal(image: #imageLiteral(resourceName: "giraffe"), name: "giraffe", url: "https://en.wikipedia.org/wiki/Giraffe"),
    Animal(image: #imageLiteral(resourceName: "ostrich"), name: "ostrich", url: "https://en.wikipedia.org/wiki/Common_ostrich"),
    Animal(image: #imageLiteral(resourceName: "lion"), name: "lion", url: "https://en.wikipedia.org/wiki/Lion"),
    Animal(image: #imageLiteral(resourceName: "gorilla"), name: "gorilla", url: "https://en.wikipedia.org/wiki/Gorilla"),
    Animal(image: #imageLiteral(resourceName: "cheetah"), name: "cheetah", url: "https://en.wikipedia.org/wiki/Cheetah"),
    Animal(image: #imageLiteral(resourceName: "elephant"), name: "elephant", url:"https://en.wikipedia.org/wiki/Elephant"),
    Animal(image: #imageLiteral(resourceName: "zebra"), name: "zebra", url: "https://en.wikipedia.org/wiki/Zebra")
]


