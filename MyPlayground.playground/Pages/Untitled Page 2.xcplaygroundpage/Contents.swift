import Foundation

struct JSON { }

func goToNetwork(_ parsingFunction: (Data) -> JSON) {
    // 2. Inside `goToNetwork`
    let dataFromNetwork = Data()
    // 3. Go to... the closure given by #1
    parsingFunction(dataFromNetwork) // equivalent of print("Returned from network")
    // 6. Finish executing `goToNetwork`
}

// 1. Jump to `func goToNetwork`
goToNetwork
    { result in
        // 4. Inside the closure given by #1
    print("Closure: Returned from network")
    return JSON()
        // 5. Finish executing the closure.
}

// 7. Finish `goToNetwork` call.
// Mental stack is the numbered list.
// 1. I need to execute goToNetwork
// 2....... Create a new data `dataFromNetwork`
// 3....... I need to execute `parsingFunction`
// 4............. executing `parsingFunction`
// 5............. finish executing parsingFunction
// 6....... finish executing goToNetwork
// 7 Continue execution
// The numbers are not in order if you go by the code line numbers.
