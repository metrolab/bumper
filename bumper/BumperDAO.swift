//
//  BumperDAO.swift
//  Pods
//
//  Created by Eli Kohen on 22/09/16.
//
//

import Foundation
#if (RX_BUMPER)
    import RxSwift
#endif

protocol BumperDAO {
    func set(_ value: Bool, forKey defaultName: String)
    func bool(forKey defaultName: String) -> Bool
    func string(forKey defaultName: String) -> String?
    func set(_ value: Any?, forKey defaultName: String)
    
    #if (RX_BUMPER)
    func observeString(for key: String) -> Observable<String?>
    #endif
}

#if (RX_BUMPER)
    import RxCocoa
    
    extension UserDefaults: BumperDAO {
        func observeString(for key: String) -> Observable<String?> {
            return rx.observe(String.self, key)
        }
    }
#else
    extension UserDefaults: BumperDAO {}
#endif

