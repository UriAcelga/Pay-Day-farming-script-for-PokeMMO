# PayDay Pickup Farming Script for PokeMMO

This script was created using **AutoHotKey v2** to automate the PayDay Pickup farming process in **PokeMMO**.

## How to Use
1. Download AutoHotKey v2 for your device
2. Open **payday_pickup.ahk**
3. Step inside **Undella Town's Pokémon Center**.
4. Press **Ctrl + Alt + F** to start the script.
5. If you encounter any bugs, press **Ctrl + Alt + P** to effectively pause the script.
6. To completely exit the script, close it from the **taskbar**.

## Precautions Before Using
In order for the script to work properly, follow these guidelines:
- **Equip Bike in slot 2**
- **Equip Teleport in slot 4**
- **Equip Super Rod in slot 5**
- **Have PayDay as the Pokémon's first attack**
- **Have Thief/Covet as the Pokémon's third attack**
- **Game must be in English!!**
- **Game must be in windowed mode** (A window resizing is done to find icons and text on the screen).
- **Game shouldn't have custom strings or HUD**
- **Ingame chat must be fully opaque** (0% transparency).
- **Ingame chat should only contain battle text** to minimize bugs.
- **No Exp. Share should be used** to level up a Pokémon while the script is running (learning moves, leveling up, or evolving can break the script).

## How it Works

When activated, this script will automatically leave the Pokémon Center, equip a bike, go to undella bay and start fishing. If it encounters a luvdisc, it will try using the attack on position 3 (for thief/covet). Otherwise defaults to using the attack on position 1 (for Pay Day). If it finds Pay Day has no PP, it will leave combat and TP Heal, starting the loop once again.

The script itself uses the **FindText v2** library to search for icons and text inside the game's window. This means it might really not work properly on clients where HUD is displaced (I tried using purely vanilla visuals for this exact reason). Even the 3D sprites plugin might make the script not use Thief/Covet on luvdisc properly (searching for luvdisc is implemented as a color search for #DC6F96 hex color code).

For those willing to tweak the script for their use case, a simple config section is placed where you can change some settings if you want to change attack orders, rod equip placement and such.

## Future Plans
- **Allow switching between multiple Pickup farm Pokémon in the party**.
- **Functions to help setup the script on most game clients**

---
This project is a work in progress. Contributions and feedback are welcome!