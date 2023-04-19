//
//  PeopleWordWidget.swift
//  Demo_carsh
//
//  Created by Mini001 on 2023/4/19.
//

import SwiftUI
import WidgetKit

struct PeopleWordProvider: IntentTimelineProvider {
      
    let peoExample = Poetry(content: "no content", origin: "no origin", author: "no author", imgUrl: "no image")
    
    func placeholder(in context: Context) -> PeopleWordEntry {
        return PeopleWordEntry(date: Date(), data: peoExample)
    }
    func getSnapshot(for configuration: PeopleWordIntent, in context: Context, completion: @escaping (PeopleWordEntry) -> Void) {
        let entry = PeopleWordEntry(date: Date(),data:peoExample)
        completion(entry)
    }
    
    @available(iOS 14.0, *)
    func getTimeline(for configuration: PeopleWordIntent, in context: Context, completion: @escaping (Timeline<PeopleWordEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
        
        // 占位图
        WidgetImageLoader.shareLoader.downLoadImage(imageUrl: "https://lmg.jj20.com/up/allimg/tx18/0217202027012.jpg") { result in
            
            switch result {
            case .success(let dataImg):
                print("成功 = \(dataImg)")
                // 每隔2个小时刷新。
                let entry = PeopleWordEntry(date: Date(),data: Poetry(content: "过了1分钟", origin: "测试数据001", author: "作者:李四", imgUrl: "https://lmg.jj20.com/up/allimg/tx18/0217202027012.jpg",icon: dataImg))
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeline)
            case .failure(let error):
                print("失败 = \(error)")
                let entry = PeopleWordEntry(date: Date(),data: Poetry(content: "过了1分钟", origin: "测试数据001", author: "作者:李四", imgUrl: "https://lmg.jj20.com/up/allimg/tx18/0217202027012.jpg"))
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeline)
            }
            
        }
        
    }
}

struct PeopleWordEntry: TimelineEntry {
    var date: Date
    public let data: Poetry
}

@available(iOS 14.0, *)
struct PeopleWordEntryView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: PeopleWordProvider.Entry
    let index = Int((Int(Date().timeIntervalSince1970) % (3600 * 24)) / 1800) % 3
    @ViewBuilder
    var body: some View {
        PeopleWordView(entry: entry.data)
    }
}

struct PeopleWordWidget: Widget {
    private let kind: String = "PeopleWordWidget"
    @available(iOS 14.0, *)
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: PeopleWordIntent.self, provider: PeopleWordProvider()) { entry in
            PeopleWordEntryView(entry: entry)
        }
        .configurationDisplayName("诗词作者")
        .description("每天记住一个作者")
        .supportedFamilies([.systemMedium])
    }
}
