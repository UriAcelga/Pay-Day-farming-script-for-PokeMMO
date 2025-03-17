#Include <FindText>
; config
CoordMode "Mouse", "Window" 
#Requires AutoHotkey v2.0
; -----------
ROD_ASSIGN := 5
POKEMMO_WINDOW := "ahk_exe javaw.exe"
WINDOW_X := 720
WINDOW_Y := 820
PAYDAY_ATTACK_POS := 1
COVET_ATTACK_POS := 3


^!F::payday_pickup()
^!P::Pause

payday_pickup() {
    WinActivate(POKEMMO_WINDOW)
    adjust_window()
    find_chat_closed()
    find_chat_unlocked()
    loop {
        leave_pkmn_center_BW()
        go_to_undella_bay()

        loop {
            fish()
            flee := combate()
            Sleep 6000
            take_held_item()
            if flee {
                break
            }
        }
        teleport()
        heal()
    }
}

find_chat_closed() {
    win := get_window_coords()
    t1:=A_TickCount, Text:=X:=Y:=""

    Text:="|<ChatClosed>**50$23.U0k303UC070I0C0c7w3Ek84X0Tt430m8A0oEE0ckU1El02Ur0B0z0m1Lv46Vw8/0EEw0UXs11BU62q087M0E9k0UE"

    if (ok:=FindText(&X, &Y, win.x, win.y + win.height - 40, win.x + 35, win.y + win.height, 0, 0, Text))
    {  
        FindText().Click(X, Y, "L")
        Sleep 1000
    }
}

find_chat_unlocked() {
    win := get_window_coords()
    t1:=A_TickCount, Text:=X:=Y:=""

    Text:="|<ChatUnlocked>**50$11.y13020o0s3z4284E8UFzk"
    CoordMode "Mouse", "Window"
    MouseClick('L', 280, 620)
    CoordMode "Mouse", "Screen"
    Sleep 1000
    if (ok:=FindText(&X, &Y, win.x + 370, win.y + 610, win.x + 390, win.x + 630, 0, 0, Text))
    {
        FindText().Click(X, Y, "L")
        Sleep 500
    }
}

find_pokemon_fainted() {
    win := get_window_coords()
    t1:=A_TickCount, Text:=X:=Y:=""

    Text:="|<Fainted>**50$46.DUw000D1a2kD00jqsD0o02tryzzvtvb6CoMswCQyPBjBatHxhqRqvZC6rNkOiIrPRbTizHNhrQyPZCKrQswiLzzzzzTzU"
    return FindText(&X:="wait1", &Y:=8, win.x + 150, win.y + 700, win.x + 220, win.y + 770, 0, 0, Text)
}

find_payday_used() {
    win := get_window_coords()
    t1:=A_TickCount, Text:=X:=Y:=""
    Text:="|<PayDay>**50$50.zU00Tk03sA004600aNTxlAjytbQNIHiAeNqnR4fNiaNwql+SPNUwCgGi7KPuve4vRpyEgcVAqINY8fMEwJiT3yo7xzOw00P000BU004k002M001s000w2"

    return FindText(&X:="wait1", &Y:=10, win.x + 150, win.y + 740, win.x + 215, win.y + 770, 0, 0, Text)

}

wait_turn_start() {
    win := get_window_coords()
    CoordMode "Mouse", "Window"
    t1:=A_TickCount, Text:=X:=Y:=""
    Text:="|<TurnStart>**50$47.0000007U1s03k0/w3E06U0LDzzrzjbiQssuFlsQrrwnjBatjZxjCvRnb/3OQ6fbqJqovxrzivBhntiMwtPNltQzjzyTzTzU"
    return FindText(&X:='wait1', &Y:=-1, win.x + 95, win.y + 740, win.x + 150, win.y + 770, 0, 0, Text)
}

find_ally_pokemon_fainted() {
    t1:=A_TickCount, Text:=X:=Y:=""

    Text:="|<AllyFaint>**50$46.0000000vrjs07k2fGUk0lU/h+tS2q1eofpMPc7fujJViUKU+3S6e3Gwfs0OcD/Gg7ViUwh+kK2q2mof1MAMODSw7UT1s0000005U000000Q8"

    return FindText(&X, &Y, 1277-150000, 608-150000, 1277+150000, 608+150000, 0, 0, Text)
}

find_fish_success() {
    win := get_window_coords()
    t1:=A_TickCount, Text:=X:=Y:=""

    Text:="|<FishSuccess>**50$68.00000000700000000001s03k0000000K00Y00000005U0900000001M02E0000000K00Y03w3bk7pUT903nUji3jMSuE0zg/zVzqDzY0Dx2zgTxXxt001Mi/BlNcCE03q/2nMKPyY07xWkgq5Yzd03zMg/91NDyE1yK/2nEKPzY0P5Wkgq5aU906XMg/5XMw2Ttja/2ljaDzU3CzWkgCzVtzzlzswD1zs7wzw2671k2608U"
    return FindText(&X, &Y, win.x + 100, win.y + 90, win.x + 200, win.y + 130, 0, 0, Text)

}

adjust_window() {
    WinMove , , WINDOW_X, WINDOW_Y, POKEMMO_WINDOW
}

leave_pkmn_center_BW() {
    Send "{Down down}"
    Sleep 1500
    Send "{Down up}"
    Sleep 2000
}

go_to_undella_bay() {
    Send "2"
    Sleep 700
    Send "{Left down}"
    Sleep 600
    Send "{Left up}"
    Sleep 500
    Send "{Down down}"
    Sleep 450
    Send "{Down up}"
    Sleep 500
    Send "{Right down}"
    Sleep 1400
    Send "{Right up}"
    Sleep 500
    Send "{Down down}"
    Sleep 150
    Send "{Down up}"
    Sleep 500
}

teleport() {
    Sleep 3000
    Send "4"
    Sleep 8000
}

heal() {
    Send "{z down}"
    Sleep 10000
    Send "{z up}"
    Sleep 100
}

fish() {
    x := 0, y := 0
    WinActivate(POKEMMO_WINDOW)
    Send ROD_ASSIGN
    Sleep 4000
    while !find_fish_success() {
        Send "z"
        Sleep 100
        Send ROD_ASSIGN
        Sleep 4000
    }
    Send "z"
}

combate() {
    flee := ""
    WinActivate(POKEMMO_WINDOW)
    
    loop {
        
        wait_turn_start()
        Send "z"
        if pokemon_es_luvdisc() {
            use_attack(COVET_ATTACK_POS)
        } else {
            use_attack(PAYDAY_ATTACK_POS)
            if !find_payday_used() {
                flee_combat()
                flee := 1
                break
            }
        }
        if find_pokemon_fainted() {
            flee := 0
            break
        }
    }
    return flee
}

pokemon_es_luvdisc() {
    CoordMode "Pixel", "Window"
    ret := PixelSearch(&x, &y, 580, 300, 590, 310, 0xDC6F96, 3)
    CoordMode "Mouse", "Window"
    return ret
}

use_attack(attackNum) {
    switch attackNum {
        case 1: use_attack_1()
        case 2: use_attack_2()
        case 3: use_attack_3()
        case 4: use_attack_4()
        default: use_attack_1()
    }
}

use_attack_1() {
    Sleep 100
    Send "z"
}

use_attack_2() {
    Sleep 100
    Send "{Right}"
    Sleep 100
    Send "z"
}

use_attack_3() {
    Sleep 100
    Send "{Down}"
    Sleep 100
    Send "z"
}

use_attack_4() {
    Sleep 100
    Send "{Down}"
    Sleep 100
    Send "{Right}"
    Sleep 100
    Send "z"
}

flee_combat() {
    Sleep 100
    Send "x"
    Sleep 100
    Send "{Down}"
    Sleep 100
    Send "{Right}"
    Sleep 100
    Send "z"
    Sleep 100
    Send "x"
}

take_held_item(farmer := 1) {
    win := get_window_coords()
    mov := 45 * (farmer - 1)
    t1:=A_TickCount, Text:=X:=Y:=""

    Text:="|<HeldItem>**20$9.zx5ch5zx5zx5cjzU"

    if (result:=FindText(&X, &Y, win.x + 670, win.y + 240 + mov, win.x + 705, win.y + 280 + mov, 0, 0, Text))
    {
        Sleep 400
        FindText().Click(X, Y, "L")
        Sleep 400
        FindText().Click(X - 60, Y + 50, "L")
    }
}

get_window_coords(windowTitle:=POKEMMO_WINDOW) {
    xPos:=yPos:=h:=w:=""
    WinGetPos(&xPos, &yPos, &w, &h, windowTitle)
    return {x: xPos, y: yPos, width: w, height: h}
}