SproutFlux — Version 0 (App Skeleton + Core Navigation)

SproutFlux is an iOS mobile application designed to help The Six Farms efficiently capture, classify, store, and analyze farm waste. The long-term goal is to integrate Azure cloud storage and AI-powered waste classification to replace manual, paper-based waste logging.

Version 0 represents the foundation layer of the app — a runnable, clean UI structure that sets up the navigation and prepares the app for later functionality.

What SproutFlux iOS Application Will Eventually Do

SproutFlux is designed to help farm staff and managers:

Log waste events with photos

Automatically classify waste using Azure AI Vision

Store waste records in Azure Cosmos DB + Blob Storage

View weekly waste insights and analytics

Receive notifications when waste exceeds thresholds

What’s Completed in v0

Version 0 includes the essential UI skeleton:

✔️ Implemented

A runnable SwiftUI app with a clean green theme

Tab-based navigation

Log Waste tab

Dashboard tab

Basic screen layouts

Placeholder elements to be replaced later

Consistent color scheme, navigation, and structure

❗ Not Implemented Yet (Planned for Later Versions)

Authentication

Waste logging functionality

Azure backend integration

AI image classification

Dashboard analytics

Role-based access

Notifications

🧭 Screens in v0
Log Waste Screen

Displays a placeholder “Start Logging” button

Sets the stage for the future waste logging workflow

Dashboard Screen

Shows placeholder text “No data yet”

Prepares layout for future data charts

🛠 Tech Stack

Swift, SwiftUI

Xcode (iOS 17+)

MVVM-ready structure

📁 Recommended Folder Structure
SproutFlux-v0
 ├── SproutFlux_App_Rajani_Final_Project_V0App.swift
 ├── ContentView.swift
 ├── LogWasteView.swift
 ├── DashboardView.swift
 └── assets/   ← add screenshots here

📸 Screenshots

![Log Waste Screen](assets/log_waste_v0.png)

🎥 Demo Video
[https://www.youtube.com/watch?v=CoIe2ah7tvA]


🗺️ SproutFlux iOS  App Development Roadmap

v1 → Authentication

v2 → Waste list & detail views

v3 → Data entry + validation

v4 → Azure backend (Cosmos DB, Blob Storage, Azure Functions)

v5 → AI Vision + Insights

v6 → Notifications, forecasting, dashboards
