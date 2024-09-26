// Sabrina: The Animated Series - Zapped!
// #ID = 9722

// $00C000: [8-bit] Debug Menu (Level Select) Flag
//          This flag is set when the player loads into a level using the secret dev level select menu. Usage of this menu is not allowed for this achievement set. After the flag is set, it will remain set for the duration of the play session.
//
//          0x00 = Debug Menu Not Used
//          0x01 = Debug Menu Used
function DebugMenuFlag() => byte(0x00C000)

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

// $00CA03: [8-bit] Hover Jump Spell Remaining Jumps
//This value decreases by 0x01 each time Sabrina uses the Hover Jump Spell to activate an extra jump while in midair. If this value is 0x00, Sabrina does not have any more extra jumps. The value is reset to 0x03 each time Sabrina lands on the ground.
//
//The maximum value is 0x03. When Sabrina jumps off the ground, this value does NOT decrease - it only decreases when Sabrina uses extra jumps while in midair. This value is initialized to 0x03 when Sabrina starts a level, even if she has not yet aquired the Hover Jump Spell.
function HoverJumpRemainingJumps() => byte(0x00CA03)

// $00CA2A: [8-bit] Current number of lives
function CurrentNumberOfLives() => byte(0x00CA2A)

// $00CA2E: [8-bit] Game State Flags
//          Bit flags describing various game states
//
//          bit0 = If set, game is paused
//          bit1 = If set, player is in an invincible state (just took damage)
//          bit2 = If set, Exit message has appeared over the player
//          bit3 = If set, the player has restarted an area (due to losing a life)
//          bit4 = If set, game is triggered to go to the Game Over screen
//          bit5 = Unknown
//          bit6 = If set, game is triggered to go to the game's ending cutscene
//          bit7 = If set, game is transitioning into a new area
function GamePausedFlag() => bit0(0x00CA2E)
function PlayerDamagedFlag() => bit1(0x00CA2E)
function ReloadedAreaFlag() => bit3(0x00CA2E)
function AreaTransitionFlag() => bit7(0x00CA2E)

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

// $011049: [8-bit] Player Status
//          Can be used to check to see if the player is in game under normal circumstances.
//
//          0x09 = Sabrina (active)
//          0x16 = Sabrina (out of lives)
//          0x0A = Salem (active)
//          0x0D = Salem (out of lives)
//          0x0C = Sabrina or Salem (lost a life)
function PlayerStatus() => byte(0x011049)

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
LEVEL_ID_W3BOSS = 0x0E

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

LEVEL_ID_PASSWORD_W1L2 = 0x41
LEVEL_ID_PASSWORD_W1L3 = 0x42
LEVEL_ID_PASSWORD_W1L4 = 0x43
LEVEL_ID_PASSWORD_W1BOSS = 0x44

LEVEL_ID_PASSWORD_W2L1 = 0x45
LEVEL_ID_PASSWORD_W2L2 = 0x46
LEVEL_ID_PASSWORD_W2L3 = 0x47
LEVEL_ID_PASSWORD_W2L4 = 0x48
LEVEL_ID_PASSWORD_W2BOSS = 0x49

LEVEL_ID_PASSWORD_W3L1 = 0x4A
LEVEL_ID_PASSWORD_W3L2 = 0x4B
LEVEL_ID_PASSWORD_W3L3 = 0x4C
LEVEL_ID_PASSWORD_W3L4 = 0x4D
LEVEL_ID_PASSWORD_W3BOSS = 0x4E

LEVEL_ID_PASSWORD_W4L1 = 0x4F
LEVEL_ID_PASSWORD_W4L2 = 0x50
LEVEL_ID_PASSWORD_W4L3 = 0x51
LEVEL_ID_PASSWORD_W4L4 = 0x52
LEVEL_ID_PASSWORD_W4BOSS = 0x53

WORLD1_LEVEL_IDS = [LEVEL_ID_W1L1, LEVEL_ID_W1L2, LEVEL_ID_W1L3, LEVEL_ID_W1L4, LEVEL_ID_W1BOSS, LEVEL_ID_EXIT_W1L1, LEVEL_ID_EXIT_W1L2, LEVEL_ID_EXIT_W1L3, LEVEL_ID_EXIT_W1L4, LEVEL_ID_PASSWORD_W1L2, LEVEL_ID_PASSWORD_W1L3, LEVEL_ID_PASSWORD_W1L4, LEVEL_ID_PASSWORD_W1BOSS]
WORLD2_LEVEL_IDS = [LEVEL_ID_W2L1, LEVEL_ID_W2L2, LEVEL_ID_W2L3, LEVEL_ID_W2L4, LEVEL_ID_W2BOSS, LEVEL_ID_EXIT_W2L1, LEVEL_ID_EXIT_W2L2, LEVEL_ID_EXIT_W2L3, LEVEL_ID_EXIT_W2L4, LEVEL_ID_PASSWORD_W2L2, LEVEL_ID_PASSWORD_W2L3, LEVEL_ID_PASSWORD_W2L4, LEVEL_ID_PASSWORD_W2BOSS]
WORLD3_LEVEL_IDS = [LEVEL_ID_W3L1, LEVEL_ID_W3L2, LEVEL_ID_W3L3, LEVEL_ID_W3L4, LEVEL_ID_W3BOSS, LEVEL_ID_EXIT_W3L1, LEVEL_ID_EXIT_W3L2, LEVEL_ID_EXIT_W3L3, LEVEL_ID_EXIT_W3L4, LEVEL_ID_PASSWORD_W3L2, LEVEL_ID_PASSWORD_W3L3, LEVEL_ID_PASSWORD_W3L4, LEVEL_ID_PASSWORD_W3BOSS]
WORLD4_LEVEL_IDS = [LEVEL_ID_W4L1, LEVEL_ID_W4L2, LEVEL_ID_W4L3, LEVEL_ID_W4L4, LEVEL_ID_W4BOSS, LEVEL_ID_EXIT_W4L1, LEVEL_ID_EXIT_W4L2, LEVEL_ID_EXIT_W4L3, LEVEL_ID_EXIT_W4L4, LEVEL_ID_PASSWORD_W4L2, LEVEL_ID_PASSWORD_W4L3, LEVEL_ID_PASSWORD_W4L4, LEVEL_ID_PASSWORD_W4BOSS]

ENTITY_ADDRESS_SPACE = 0x01107B
ENTITY_ADDRESS_SPACE_SIZE = 0x7B

ENTITY_OFFSET_STATE = 0x02

PLAYER_STATE_CRUSH_SPELL_ACTIVATE = 0x6579
PLAYER_STATE_BUBBLE_SPELL_ACTIVATE = 0x6787
PLAYER_STATE_TELEPORT_SPELL_ACTIVATE = 0x5F24

SABRINA_STATUS_ACTIVE = 0x09
SALEM_STATUS_ACTIVE = 0x0A

PLAYER_STATUS_LOST_LIFE = 0x0C

SABRINA_STATUS_LOST_ALL_LIVES = 0x16
SALEM_STATUS_LOST_ALL_LIVES = 0x0D

W1_BOSS_STATE_TRANSFORM = 0x4C07
W2_BOSS_STATE_TRANSFORM = 0x5B20
W3_BOSS_STATE_TRANSFORM = 0x5100
W4_BOSS_STATE_TRANSFORM = 0x6662


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

function LockIfUsedDebugMenuInThisSession() => unless(once(DebugMenuFlag() == 0x01))

function GamePaused() => GamePausedFlag() == 1

function StartedLevelOnThisFrame(levelId) {
    levelCheck = LevelId() == levelId
    initialAreaLoad = prev(AreaTransitionFlag()) == 1 && AreaTransitionFlag() == 0
    sabrinaLoaded = HoverJumpRemainingJumps() == 0x03
    
    return levelCheck && initialAreaLoad && sabrinaLoaded
}

function ClearLevelOnThisFrame(levelId, levelExitId) => LockIfUsedDebugMenuInThisSession() && prev(LevelId()) == levelId && LevelId() == levelExitId

function PlayerEnteredStateOnThisFrame(playerState) => prev(PlayerState()) != playerState && PlayerState() == playerState

function SabrinaActive() => PlayerStatus() == SABRINA_STATUS_ACTIVE

function PlayerOutOfHealthOnThisFrame() => (prev(PlayerStatus()) != PLAYER_STATUS_LOST_LIFE && PlayerStatus() == PLAYER_STATUS_LOST_LIFE) ||
                                           (prev(PlayerStatus()) != SABRINA_STATUS_LOST_ALL_LIVES && PlayerStatus() == SABRINA_STATUS_LOST_ALL_LIVES) ||
                                           (prev(PlayerStatus()) != SALEM_STATUS_LOST_ALL_LIVES && PlayerStatus() == SALEM_STATUS_LOST_ALL_LIVES)

function EntityAddress(slot) => ENTITY_ADDRESS_SPACE + (ENTITY_ADDRESS_SPACE_SIZE * slot)

function EntityState(address) => word(address + ENTITY_OFFSET_STATE)

function BossDefeatedOnThisFrame(levelId, bossDefeatedState, allowDebug=false) {
    bossSlot = -1
    if (levelId == LEVEL_ID_W1BOSS) { bossSlot = 0 }
    if (levelId == LEVEL_ID_W2BOSS) { bossSlot = 3 }
    if (levelId == LEVEL_ID_W3BOSS) { bossSlot = 0 }
    if (levelId == LEVEL_ID_W4BOSS) { bossSlot = 5 }

    bossState = EntityState(EntityAddress(bossSlot))
    bossDefeated = LevelId() == levelId && prev(bossState) != bossDefeatedState && bossState == bossDefeatedState
    if (allowDebug) {
        return bossDefeated
    } else {
        return LockIfUsedDebugMenuInThisSession() && bossDefeated
    }
}

function MasterWorld(allLevelIds, firstLevelId, bossLevelId, bossStateTransform) {
    startCondition = once(StartedLevelOnThisFrame(firstLevelId))
    resetCondition = never(PlayerOutOfHealthOnThisFrame()) && never(!InArray(LevelId(), allLevelIds))
    
    // Note that while we are specifying allowDebug true here, we are still preventing debug usage on the return line of this function
    triggerCondition = trigger_when(once(BossDefeatedOnThisFrame(bossLevelId, bossStateTransform, allowDebug=true)))
    
    return LockIfUsedDebugMenuInThisSession() && startCondition && resetCondition && triggerCondition
}


// ---------------------------
// ------ Achievements -------
// ---------------------------

achievement(
    id = 465195, badge = "526350",
    title = "Greendale School Level 1 Clear", points = 1,
    description = "Clear Level 1-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W1L1, LEVEL_ID_EXIT_W1L1)
)

achievement(
    id = 465199, badge = "526361",
    title = "Greendale School Level 2 Clear", points = 1,
    description = "Clear Level 1-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W1L2, LEVEL_ID_EXIT_W1L2)
)

achievement(
    id = 465205, badge = "526362",
    title = "Greendale School Level 3 Clear", points = 1,
    description = "Clear Level 1-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W1L3, LEVEL_ID_EXIT_W1L3)
)

achievement(
    id = 465208, badge = "526921",
    title = "Greendale School Level 4 Clear", points = 1,
    description = "Clear Level 1-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W1L4, LEVEL_ID_EXIT_W1L4)
)

achievement(
    id = 465211, badge = "526393",
    title = "Harvzilla", points = 5,
    description = "Transform crocodile Harvey back into a human",
    type = "progression",
    trigger = BossDefeatedOnThisFrame(LEVEL_ID_W1BOSS, W1_BOSS_STATE_TRANSFORM)
)

achievement(
    id = 465527, badge = "526840",
    title = "Beach Festival Level 1 Clear", points = 2,
    description = "Clear Level 2-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L1, LEVEL_ID_EXIT_W2L1)
)

achievement(
    id = 465528, badge = "526841",
    title = "Beach Festival Level 2 Clear", points = 2,
    description = "Clear Level 2-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L2, LEVEL_ID_EXIT_W2L2)
)

achievement(
    id = 465529, badge = "526842",
    title = "Beach Festival Level 3 Clear", points = 2,
    description = "Clear Level 2-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L3, LEVEL_ID_EXIT_W2L3)
)

achievement(
    id = 465530, badge = "526843",
    title = "Beach Festival Level 4 Clear", points = 2,
    description = "Clear Level 2-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L4, LEVEL_ID_EXIT_W2L4)
)

achievement(
    id = 465531, badge = "526844",
    title = "Wiccan of the Sea", points = 5,
    description = "Transform squid Chloe back into a human",
    type = "progression",
    trigger = BossDefeatedOnThisFrame(LEVEL_ID_W2BOSS, W2_BOSS_STATE_TRANSFORM)
)

achievement(
    id = 465540, badge = "526853",
    title = "Town Center Mall Level 1 Clear", points = 3,
    description = "Clear Level 3-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L1, LEVEL_ID_EXIT_W3L1)
)

achievement(
    id = 465541, badge = "526854",
    title = "Town Center Mall Level 2 Clear", points = 3,
    description = "Clear Level 3-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L2, LEVEL_ID_EXIT_W3L2)
)

achievement(
    id = 465542, badge = "526855",
    title = "Town Center Mall Level 3 Clear", points = 3,
    description = "Clear Level 3-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L3, LEVEL_ID_EXIT_W3L3)
)

achievement(
    id = 465543, badge = "526856",
    title = "Town Center Mall Level 4 Clear", points = 3,
    description = "Clear Level 3-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L4, LEVEL_ID_EXIT_W3L4)
)

achievement(
    id = 465551, badge = "526864",
    title = "Get Lost Bird Brain", points = 5,
    description = "Transform bird Gem back into a human",
    type = "progression",
    trigger = BossDefeatedOnThisFrame(LEVEL_ID_W3BOSS, W3_BOSS_STATE_TRANSFORM)
)

achievement(
    id = 465594, badge = "526908",
    title = "Greendale City Zoo Level 1 Clear", points = 4,
    description = "Clear Level 4-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L1, LEVEL_ID_EXIT_W4L1)
)

achievement(
    id = 465595, badge = "526911",
    title = "Greendale City Zoo Level 2 Clear", points = 4,
    description = "Clear Level 4-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L2, LEVEL_ID_EXIT_W4L2)
)

achievement(
    id = 465596, badge = "526912",
    title = "Greendale City Zoo Level 3 Clear", points = 4,
    description = "Clear Level 4-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L3, LEVEL_ID_EXIT_W4L3)
)

achievement(
    id = 465597, badge = "526914",
    title = "Greendale City Zoo Level 4 Clear", points = 4,
    description = "Clear Level 4-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L4, LEVEL_ID_EXIT_W4L4)
)

achievement(
    id = 465599, badge = "526918",
    title = "All the Monkeys in the House Go Yeah", points = 25,
    description = "Transform gorilla Slugloafe back into a human",
    type = "win_condition",
    trigger = BossDefeatedOnThisFrame(LEVEL_ID_W4BOSS, W4_BOSS_STATE_TRANSFORM)
)

achievement(
    id = 465601, badge = "526927",
    title = "Can't Jump Far, That's Not Fair, Chant This Spell, Jump Midair!", points = 2,
    description = "Activate the Hover Jump Spell while playing as Sabrina",
    trigger = LockIfUsedDebugMenuInThisSession() && SabrinaActive() && prev(HoverJumpRemainingJumps()) == 0x03 && HoverJumpRemainingJumps() == 0x02
)

achievement(
    id = 465612, badge = "526944",
    title = "Blocks Below, Form a Queue, Chant This Spell, Break On Through!", points = 2,
    description = "Activate the Crush Spell while playing as Sabrina",
    trigger = LockIfUsedDebugMenuInThisSession() && SabrinaActive() && PlayerEnteredStateOnThisFrame(PLAYER_STATE_CRUSH_SPELL_ACTIVATE)
)

achievement(
    id = 465613, badge = "526949",
    title = "Paths Above I Need a Lift, Chant This Spell And Up I'll Drift!", points = 2,
    description = "Activate the Bubble Spell while playing as Sabrina",
    trigger = LockIfUsedDebugMenuInThisSession() && SabrinaActive() && PlayerEnteredStateOnThisFrame(PLAYER_STATE_BUBBLE_SPELL_ACTIVATE)
)

achievement(
    id = 465631, badge = "527006",
    title = "Stuck Again, Not a Problem, Pass Through Walls, Pretty Awesome!", points = 2,
    description = "Activate the Teleport Spell while playing as Sabrina",
    trigger = LockIfUsedDebugMenuInThisSession() && SabrinaActive() && PlayerEnteredStateOnThisFrame(PLAYER_STATE_TELEPORT_SPELL_ACTIVATE)
)

achievement(
    id = 466041, badge = "527640",
    title = "Greendale School Master", points = 25,
    description = "Start from Level 1-1 and clear all levels and defeat the boss in World 1 without ever losing a life",
    trigger = MasterWorld(WORLD1_LEVEL_IDS, LEVEL_ID_W1L1, LEVEL_ID_W1BOSS, W1_BOSS_STATE_TRANSFORM)
)

achievement(
    id = 466044, badge = "527652",
    title = "Beach Festival Master", points = 25,
    description = "Start from Level 2-1 and clear all levels and defeat the boss in World 2 without ever losing a life",
    trigger = MasterWorld(WORLD2_LEVEL_IDS, LEVEL_ID_W2L1, LEVEL_ID_W2BOSS, W2_BOSS_STATE_TRANSFORM)
)

achievement(
    id = 466045, badge = "527653",
    title = "Town Center Mall Master", points = 25,
    description = "Start from Level 3-1 and clear all levels and defeat the boss in World 3 without ever losing a life",
    trigger = MasterWorld(WORLD3_LEVEL_IDS, LEVEL_ID_W3L1, LEVEL_ID_W3BOSS, W3_BOSS_STATE_TRANSFORM)
)

achievement(
    id = 466046, badge = "527654",
    title = "Greendale City Zoo Master", points = 25,
    description = "Start from Level 4-1 and clear all levels and defeat the boss in World 4 without ever losing a life",
    trigger = MasterWorld(WORLD4_LEVEL_IDS, LEVEL_ID_W4L1, LEVEL_ID_W4BOSS, W4_BOSS_STATE_TRANSFORM)
)


// -------------------------
// ----- Leaderboards ------
// -------------------------

function BossTimeTrialStartedOnThisFrame(levelId) => StartedLevelOnThisFrame(levelId) || (LevelId() == levelId && prev(PlayerStatus()) != SABRINA_STATUS_ACTIVE && PlayerStatus() == SABRINA_STATUS_ACTIVE)

function BossTimeTrialLeaderboardValue(levelId) => measured(tally(0, !GamePaused() && LevelId() == levelId))

leaderboard(
    id=118198,
    title="Greendale School Boss Time Trial",
    description="Defeat the boss of World 1 as quickly as you can",
    start=BossTimeTrialStartedOnThisFrame(LEVEL_ID_W1BOSS),
    cancel=LevelId() != LEVEL_ID_W1BOSS || PlayerOutOfHealthOnThisFrame(),
    submit=BossDefeatedOnThisFrame(LEVEL_ID_W1BOSS, W1_BOSS_STATE_TRANSFORM, allowDebug=true),
    value=BossTimeTrialLeaderboardValue(LEVEL_ID_W1BOSS),
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    id=118269,
    title="Beach Festival Boss Time Trial",
    description="Defeat the boss of World 2 as quickly as you can",
    start=BossTimeTrialStartedOnThisFrame(LEVEL_ID_W2BOSS),
    cancel=LevelId() != LEVEL_ID_W2BOSS || PlayerOutOfHealthOnThisFrame(),
    submit=BossDefeatedOnThisFrame(LEVEL_ID_W2BOSS, W2_BOSS_STATE_TRANSFORM, allowDebug=true),
    value=BossTimeTrialLeaderboardValue(LEVEL_ID_W2BOSS),
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    id=118330,
    title="City Town Mall Boss Time Trial",
    description="Defeat the boss of World 3 as quickly as you can",
    start=BossTimeTrialStartedOnThisFrame(LEVEL_ID_W3BOSS),
    cancel=LevelId() != LEVEL_ID_W3BOSS || PlayerOutOfHealthOnThisFrame(),
    submit=BossDefeatedOnThisFrame(LEVEL_ID_W3BOSS, W3_BOSS_STATE_TRANSFORM, allowDebug=true),
    value=BossTimeTrialLeaderboardValue(LEVEL_ID_W3BOSS),
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    title="Greendale City Zoo Boss Time Trial",
    description="Defeat the boss of World 4 as quickly as you can",
    start=BossTimeTrialStartedOnThisFrame(LEVEL_ID_W4BOSS),
    cancel=LevelId() != LEVEL_ID_W4BOSS || PlayerOutOfHealthOnThisFrame(),
    submit=BossDefeatedOnThisFrame(LEVEL_ID_W4BOSS, W4_BOSS_STATE_TRANSFORM, allowDebug=true),
    value=BossTimeTrialLeaderboardValue(LEVEL_ID_W4BOSS),
    format="FRAMES",
    lower_is_better=true
)


// -------------------------
// ----- Rich Presence -----
// -------------------------

PASSWORD_SCREEN_LEVEL_IDS = [0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53]

function NotInGame() => RpInGameFlag() == 0x00 || PlayerActiveStatus() != 0x00 || PlayerStateCategory() == 0x5F || PlayerStateCategory() == 0x69 || PlayerStateCategory() == 0x6A || InArray(LevelId(), PASSWORD_SCREEN_LEVEL_IDS)

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
    LEVEL_ID_W1BOSS: "fighting Harvey the crocodile",
    LEVEL_ID_W2BOSS: "fighting Chloe the squid",
    LEVEL_ID_W3BOSS: "fighting Gem the bird",
    LEVEL_ID_W4BOSS: "fighting Slugloafe the gorilla"
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
