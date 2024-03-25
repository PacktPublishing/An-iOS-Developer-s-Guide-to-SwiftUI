//
//  ContentView.swift
//  AsyncStreamExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var exchangeRate: Double = 0.0
    @State private var isFinished: Bool = false
    
    var body: some View {
        if isFinished {
            Text("Finished")
                .font(.largeTitle)
                .padding()
        } else {
            NavigationView {
                VStack {
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                            .padding()
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                        Image(systemName: "eurosign.circle.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    Text("1 USD is \(exchangeRate, specifier: "%.4f") EUR")
                        .font(.largeTitle)
                        .padding()
                    Button(action: {
                        isFinished = true
                    }) {
                        Text("Stop")
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .navigationTitle("USD to EUR Rate")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            Task {
                                do {
                                    exchangeRate = try await refreshExchangeRate()
                                } catch {
                                    print(error)
                                }
                            }
                        }) {
                            Text("Refresh")
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                }
                .task {
                    for await rate in exchangeRateStream() {
                        exchangeRate = rate
                    }
                }
            }
        }
    }


// The AsyncStream definition, that is the interesting part, where the magic happens, is the following:


    func exchangeRateStream() -> AsyncStream<Double> {
        AsyncStream(Double.self) { continuation in
            Task {
                while true {
                    if isFinished {
                        continuation.finish()
                        break
                    }
                    do {
                        let rate = try await refreshExchangeRate()
                        continuation.yield(rate)
                    } catch {
                        print("Error fetching exchange rate: \(error)")
                        continuation.finish()
                        break
                    }
                    try await Task.sleep(nanoseconds: 10 * NSEC_PER_SEC)// sleep 10 seconds
                }
            }
        }
    }

//To conclude our code, we need to add the following final part of the file, that contains a simple function that fetches the current rate of exchange from the public API of the Frankfurt stock market and decodes it:
//



func refreshExchangeRate() async throws -> Double {
        let url = URL(string: "https://api.frankfurter.app/latest?from=USD&to=EUR")!
        let (data, _) = try await URLSession.shared.data(from: url)
        if let rate = parse(data) {
            return rate
        } else {
            throw NSError(domain: "Unable to parse exchange rate", code: 0, userInfo: nil)
        }
    }
    
    func parse(_ data: Data) -> Double? {
        do {
            let result = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
            return result.rates["EUR"]
        } catch {
            print("Error parsing JSON: \(error)")
            return nil
        }
    }
}

struct ExchangeRateResponse: Codable {
    let rates: [String: Double]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
