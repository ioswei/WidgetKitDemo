//
//  LockTool.swift
//  Demo_carsh
//
//  Created by Mini001 on 2023/4/19.
//

import WidgetKit
import SwiftUI
import Intents

struct SimpleEntry: TimelineEntry {
    public let date: Date
}

struct PayToolsProvider: IntentTimelineProvider {

    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date())
    }
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    @available(iOS 14.0, *)
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let currentDate = Date()
        let entry = SimpleEntry(date: currentDate)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

@available(iOS 14.0, *)
struct PayToolsEntryView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: PayToolsProvider.Entry
    
    @ViewBuilder
    var body: some View {
        PayToolsMediumView()
    }
}

struct LockToolWidget: Widget {
    private let kind: String = "LockToolWidget"
    @available(iOS 14.0, *)
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: PayToolsProvider()){ entry in
            PayToolsEntryView(entry: entry)
        }
        .configurationDisplayName("支付助手")
        .description("快捷启动扫一扫和支付码")
        .supportedFamilies([.systemMedium])
        
    }
}
