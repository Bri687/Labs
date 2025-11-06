---
id: 22D337B1-98A4-425C-95D8-861E4A212A93
name: Advanced Navigation
type: lab
assignDay: ND13
dueDay: ND16
location: 
---

# Advanced Navigation Lab Requirements - Due Dec 10, 2025

## Objectives
- Implement a router in a practical setting

## Overview
Your studio MythWorks is about to pitch an AR dragon‑taming game to investors. While you haven't implemented the AR features just yet, you need to prep some UI for an investor meeting. Your boss's instructions are:

“We need a DragonDex companion app by tomorrow. Players should be able to swipe through dragons, dive into their stats, read a list of special powers, and tweak the app’s theme color. Keep navigation pristine—one SwiftUI Router, zero spaghetti. Go!”


Build a router that will allow you to navigate through four screens:
* Dragon List - Scrollable gallery of dragons (name & thumbnail).
* Dragon Detail - Big artwork, species, lore snippet, fire rating, or whatever other data you want to include.
* Powers List - Button on the detail screen pushes on a view that lists the dragons abilities (e.g., Inferno Burst, Sky Dive).
* Settings - Gear icon on the dragon list screen opens a screen with a color picker which changes the background color of every screen.

The UI of the screens themselves can be barebones. The important thing is demonstrating your ability to build a router.

## Black Diamond

* Add a Tab Bar
    * Tab 1 – Dragons (existing flow)
    * Tab 2 – Riders (list of dragon riders → Rider Detail).

* 	Multiple Routers
    * 	MainRouter – handles tab switching + Settings sheet presentation.
    * 	DragonsRouter – drives the DragonDex flow.
    * 	RidersRouter – drives the rider flow.

* 	Settings as a Sheet – Present the Settings screen modally through the MainRouter.

