// Blur ability, that gives 100% evasion based on amount of max mana unit has

function Trig_Blur_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0AT' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Blur_Actions takes nothing returns nothing
    call UnitAddAbilityBJ( 'A0AS', GetSpellAbilityUnit() ) // Instead of 'A0AS' past your ability code that gives 100% evasion
    call TriggerSleepAction( GetUnitStateSwap(UNIT_STATE_MAX_MANA, GetTriggerUnit()) * 0.001 )
    call UnitRemoveAbilityBJ( 'A0AS', GetTriggerUnit() )
    call UnitRemoveBuffBJ( 'B03G', GetTriggerUnit() ) // Remove the buff from the unit, in order to indicate that its effect finished. In order to get this effect in first place, I recommend deriving blur ability from any ability that self-casts, like Berserk. If you don't have a buff indicating evasion in first place, you can skip this part. 
endfunction

//===========================================================================
function InitTrig_Blur takes nothing returns nothing
    set gg_trg_Blur = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Blur, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_Blur, Condition( function Trig_Blur_Conditions ) )
    call TriggerAddAction( gg_trg_Blur, function Trig_Blur_Actions )
endfunction

