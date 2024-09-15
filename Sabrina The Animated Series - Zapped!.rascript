// Sabrina: The Animated Series - Zapped!
// #ID = 9722

// $00C9FA: [8-bit] Character Flag
//          Can be used to tell which character the player is currently controlling.
//          
//          0x04 = Sabrina
//          0x05 = Salem
function CharacterFlag() => byte(0x00C9FA)

// $00C9FB: [8-bit] Animal Counter
//          Represents how many animals are left in the current level.
//          When this value reaches 0x00, Sabrina can enter the exit level door.
function AnimalCounter() => byte(0x00C9FB)

// $00C9FC: [8-bit] Damage Counter
//          Increases in value when Sabrina/Salem take damage.
//          Represents number of hearts left.
//          0x00 = 3 hearts left
//          0x01 = 2 hearts left
//          0x02 = 1 heart left
//          0x03 = 0 hearts left
//          
//          If Sabrina/Salem take a hit when this value is 0x03, a life will be lost.
function DamageCounter() => byte(0x00C9FC)

// $00C9FD: [8-bit] Current Power Star Count
//          This value represents the number of Power Stars the player has collected in the current level.
//
//          This value ranges from 0x00 (none collected) to 0x05 (all 5 collected)
function CurrentPowerStarCount() => byte(0x00c9fd)

// $00C9FF: [8-bit] Level ID
//          Keeps track of which level is currently loaded. The game uses this value to determine which level to load next when certain events happen that cause a level load to occur. When Sabrina uses the Exit Door in a level, this value will change temporarily to a unique value to represent the level outro sequence for that specific level. The Password Screen shown after that will also have it's own unique value, which determines what level to send Sabrina to next. Note that boss fights do not have their own password screens like in this game's sequel, but there will still be a unique Level ID value in the Password Screen section for these loading transitions.
//          
//          Level In Progress:
//          0x00 = Level 1-1 (also, in menus before game starts)
//          0x01 = Level 1-2 (also, credits screen)
//          0x02 = Level 1-3
//          0x03 = Level 1-4
//          0x04 = W1 Boss
//          0x05 = Level 2-1
//          0x06 = Level 2-2
//          0x07 = Level 2-3
//          0x08 = Level 2-4
//          0x09 = W2 Boss
//          0x0A = Level 3-1
//          0x0B = Level 3-2
//          0x0C = Level 3-3
//          0x0D = Level 3-4
//          0x0E = W3 Boss
//          0x0F = Level 4-1
//          0x10 = Level 4-2
//          0x11 = Level 4-3
//          0x12 = Level 4-4
//          0x13 = W4 Boss
//          
//          Exiting Level:
//          0x80 = Level 1-1
//          0x81 = Level 1-2
//          0x82 = Level 1-3
//          0x83 = Level 1-4
//          0x85 = Level 2-1
//          0x86 = Level 2-2
//          0x87 = Level 2-3
//          0x88 = Level 2-4
//          0x8A = Level 3-1
//          0x8B = Level 3-2
//          0x8C = Level 3-3
//          0x8D = Level 3-4
//          0x8F = Level 4-1
//          0x90 = Level 4-2
//          0x91 = Level 4-3
//          0x92 = Level 4-4
//          
//          Password Screen (Indicartes the level the password shown is for):
//          0x41 = Level 1-2
//          0x42 = Level 1-3
//          0x43 = Level 1-4
//          0x44 = W1 Boss
//          0x45 = Level 2-1
//          0x46 = Level 2-2
//          0x47 = Level 2-3
//          0x48 = Level 2-4
//          0x49 = W2 Boss
//          0x4A = Level 3-1
//          0x4B = Level 3-2
//          0x4C = Level 3-3
//          0x4D = Level 3-4
//          0x4E = W3 Boss
//          0x4F = Level 4-1
//          0x50 = Level 4-2
//          0x51 = Level 4-3
//          0x52 = Level 4-4
//          0x53 = W4 Boss
function LevelId() => byte(0x00C9FF)

// $00CA2A: [8-bit] Current number of lives
function CurrentNumberOfLives() => byte(0x00CA2A)

// $00ca30: [8-bit] In-Game Flag
//          This value will never be 0x00 when In-Game.
//          Used in Rich Presence only.
function RpInGameFlag() => byte(0x00ca30)

// $011000: [8-bit] Entity Active Status
//          The first entity is always the player.
function PlayerActiveStatus() => byte(0x011000)

// $011002: [16-bit] Player State
function PlayerState() => word(0x011002)

// $011003: [8-bit] [8-bit] Player State Category
//          The first 8 bits of the Player State value can be used to determine the category of action currently being performed. This is helpful for things like identifying when the Player Entity is being used for something not in-game.
//
//          0x5F = Main Menu
//          0x6A = Taking Notes (password screen)
//          0x69 = Taking Notes (password screen)
function PlayerStateCategory() => byte(0x011003)

// $01102F: [16-bit BE] Player Sprite Index
function PlayerSpriteIndex() => word_be(0x01102F)

// $01107B: [8-bit] Entity 1 Active Status
//          
//          0x00 = Active Entity
//          0xFF = Inactive Entity
//          
//          This address is the start of the entity address space. Starting from here, adding 0x7B to this address will bring you to the start of the next entity address space. Continuously adding 0x7B will bring you to the start of each available entity address space.
//          
//          The following offsets correspond to various properties for the entity when applied to the active status address:
//          +0x02 = Entity State (16-bit)
//          +0x20 = Present Box Contents (8-bit)
//          +0x27 = Entity Clear Bit Offset (16-bit)
function Entity1ActiveStatus() => word(0x01107B)

// $0110A2: [16-bit] Entity 1 Clear Bit Offset
//          Subtract 0xD000 from this value and then add the result to 0x012000 to determine the address of this entities clear bit. See notes at address 0x012000 to learn more about the clear bit.
function Entity1ClearBitOffset() => word(0x0110A2)

// $012000: [8-bit] Entity Clear Bit Address Space Marker
//          This address marks the start of an area in memory that tracks if an entity should spawn into the level when the player enters the area of the level where the entity is placed. Each entity address space will have an 8-bit value stored that when added to this address as an offset points to where that entity clear bit is located in memory.
//          
//          0x00 = Entity should spawn
//          0x01 = Entity should not spawn
//          
//          The bit will be flipped to 0x01 when the player enters the area of the level that causes the entity to spawn in. If the player leaves the area that the entity is loaded into, the bit will flip back to 0x00 when the entity de-spawns. If the player interacted with the entity such that it was removed from the level, the bit will stay flipped to 0x01 when the player leaves the area that the entity was placed in. This is how the game remembers to not spawn the entity back in if the player returns to that area again.
function EntityClearBitAddressSpaceMarker() => byte(0x012000)



// ---------------------------
// -------- Constants --------
// ---------------------------

LEVEL_ID_W1L1 = 0x00
LEVEL_ID_W1L2 = 0x01
LEVEL_ID_W1L3 = 0x02
LEVEL_ID_W1L4 = 0x03
LEVEL_ID_W1BOSS = 0x04

LEVEL_ID_W2L1 = 0x05
LEVEL_ID_W2L2 = 0x06
LEVEL_ID_W2L3 = 0x07
LEVEL_ID_W2L4 = 0x08
LEVEL_ID_W2BOSS = 0x09

LEVEL_ID_W3L1 = 0x0A
LEVEL_ID_W3L2 = 0x0B
LEVEL_ID_W3L3 = 0x0C
LEVEL_ID_W3L4 = 0x0D
LEVEL_ID_W3BOSS = 0x1E

LEVEL_ID_W4L1 = 0x0F
LEVEL_ID_W4L2 = 0x10
LEVEL_ID_W4L3 = 0x11
LEVEL_ID_W4L4 = 0x12
LEVEL_ID_W4BOSS = 0x13

LEVEL_ID_EXIT_W1L1 = 0x80
LEVEL_ID_EXIT_W1L2 = 0x81
LEVEL_ID_EXIT_W1L3 = 0x82
LEVEL_ID_EXIT_W1L4 = 0x83

LEVEL_ID_EXIT_W2L1 = 0x85
LEVEL_ID_EXIT_W2L2 = 0x86
LEVEL_ID_EXIT_W2L3 = 0x87
LEVEL_ID_EXIT_W2L4 = 0x88

LEVEL_ID_EXIT_W3L1 = 0x8A
LEVEL_ID_EXIT_W3L2 = 0x8B
LEVEL_ID_EXIT_W3L3 = 0x8C
LEVEL_ID_EXIT_W3L4 = 0x8D

LEVEL_ID_EXIT_W4L1 = 0x8F
LEVEL_ID_EXIT_W4L2 = 0x90
LEVEL_ID_EXIT_W4L3 = 0x91
LEVEL_ID_EXIT_W4L4 = 0x92



// ---------------------------
// ----- Logic Functions -----
// ---------------------------

function InArray(value, array) {
    result = false
    for compare in array {
        result = result || compare == value
    }
    return result
}



// ---------------------------
// ------ Achievements -------
// ---------------------------



// -------------------------
// ----- Leaderboards ------
// -------------------------



// -------------------------
// ----- Rich Presence -----
// -------------------------

PASSWORD_SCREEN_LEVEL_IDS = [0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53]

function NotInGame() => RpInGameFlag() == 0x00  PlayerActiveStatus() != 0x00 || PlayerStateCategory() == 0x5F || PlayerStateCategory() == 0x69 || PlayerStateCategory() == 0x6A || InArray(LevelId(), PASSWORD_SCREEN_LEVEL_IDS)

LevelLookup = {
    LEVEL_ID_W1L1: "in Level 1-1",
    LEVEL_ID_EXIT_W1L1: "in Level 1-1",
    LEVEL_ID_W1L2: "in Level 1-2",
    LEVEL_ID_EXIT_W1L2: "in Level 1-2",
    LEVEL_ID_W1L3: "in Level 1-3",
    LEVEL_ID_EXIT_W1L3: "in Level 1-3",
    LEVEL_ID_W1L4: "in Level 1-4",
    LEVEL_ID_EXIT_W1L4: "in Level 1-4",
    LEVEL_ID_W2L1: "in Level 2-1",
    LEVEL_ID_EXIT_W2L1: "in Level 2-1",
    LEVEL_ID_W2L2: "in Level 2-2",
    LEVEL_ID_EXIT_W2L2: "in Level 2-2",
    LEVEL_ID_W2L3: "in Level 2-3",
    LEVEL_ID_EXIT_W2L3: "in Level 2-3",
    LEVEL_ID_W2L4: "in Level 2-4",
    LEVEL_ID_EXIT_W2L4: "in Level 2-4",
    LEVEL_ID_W3L1: "in Level 3-1",
    LEVEL_ID_EXIT_W3L1: "in Level 3-1",
    LEVEL_ID_W3L2: "in Level 3-2",
    LEVEL_ID_EXIT_W3L2: "in Level 3-2",
    LEVEL_ID_W3L3: "in Level 3-3",
    LEVEL_ID_EXIT_W3L3: "in Level 3-3",
    LEVEL_ID_W3L4: "in Level 3-4",
    LEVEL_ID_EXIT_W3L4: "in Level 3-4",
    LEVEL_ID_W4L1: "in Level 4-1",
    LEVEL_ID_EXIT_W4L1: "in Level 4-1",
    LEVEL_ID_W4L2: "in Level 4-2",
    LEVEL_ID_EXIT_W4L2: "in Level 4-2",
    LEVEL_ID_W4L3: "in Level 4-3",
    LEVEL_ID_EXIT_W4L3: "in Level 4-3",
    LEVEL_ID_W4L4: "in Level 4-4",
    LEVEL_ID_EXIT_W4L4: "in Level 4-4",
    LEVEL_ID_W1BOSS: "fighting Harvey the Crocodile",
    LEVEL_ID_W2BOSS: "fighting Chloe the Octopus",
    LEVEL_ID_W3BOSS: "fighting Gem the Duck",
    LEVEL_ID_W4BOSS: "fighting Slugloafe the Ape"
}

HeartLookup = {
    0x00: "♥♥♥",
    0x01: "♥♥-",
    0x02: "♥--",
    0x03: "---"
}

CharacterLookup = {
    0x05: "Salem"
}

StarLookup = {
    0x00: "-----",
    0x01: "★----",
    0x02: "★★---",
    0x03: "★★★--",
    0x04: "★★★★-",
    0x05: "★★★★★"
}

rich_presence_conditional_display(NotInGame(), "In Menus")

rich_presence_conditional_display(LevelId() == LEVEL_ID_W1BOSS || LevelId() == LEVEL_ID_W2BOSS || LevelId() == LEVEL_ID_W3BOSS || LevelId() == LEVEL_ID_W4BOSS, "Sabrina is {0} | {1}",
    rich_presence_lookup("Level", LevelId(), LevelLookup, fallback="lost in the underworld's hall of doors"),
    rich_presence_lookup("Hearts", DamageCounter(), HeartLookup, fallback="♥♥♥")
)

rich_presence_display("{0} is {1} | {2} | {3} | 🐻 x {4}",
    rich_presence_lookup("Character", CharacterFlag(), CharacterLookup, fallback="Sabrina"),
    rich_presence_lookup("Level", LevelId(), LevelLookup, fallback="lost in the underworld's hall of doors"),
    rich_presence_lookup("Hearts", DamageCounter(), HeartLookup, fallback="♥♥♥"),
    rich_presence_lookup("Stars", CurrentPowerStarCount(), StarLookup, fallback="-----"),
    rich_presence_value("Animals", AnimalCounter())
)
