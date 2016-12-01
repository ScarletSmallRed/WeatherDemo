//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler:  @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}