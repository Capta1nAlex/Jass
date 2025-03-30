function Trig_Genesis_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0AO' ) ) then // checks your spell ID
        return false
    endif
    return true
endfunction

function Trig_Genesis_Actions takes nothing returns nothing
    local location spellTargetLoc = GetSpellTargetLoc()
    local unit u = GetSpellAbilityUnit()
    local destructable d
    call CreateDestructableLoc( 'LTlt', GetSpellTargetLoc(), GetRandomDirectionDeg(), 1, 0 ) 
    set d = GetLastCreatedDestructable()
    call SetDestructableAnimationBJ( d, "birth" )
    call SetDestAnimationSpeedPercent( d, 120.00 )
    call SetUnitAnimation( GetSpellAbilityUnit(), "Spell Second" )
    call CreateNUnitsAtLoc( 1, 'h04L', GetOwningPlayer(GetSpellAbilityUnit()), GetSpellTargetLoc(), 0) // change h04L to your dummy unit
    call UnitAddAbilityBJ( 'A0AN', GetLastCreatedUnit() )
    call UnitApplyTimedLifeBJ( 5.00, 'BTLF', GetLastCreatedUnit() ) // add your force of nature ability to a dummy unit
    call TriggerSleepAction( 3.00 ) // How long does tree should last
    call IssuePointOrderLocBJ( GetLastCreatedUnit(), "forceofnature", GetDestructableLoc(d) )
    call RemoveLocation(spellTargetLoc)
    set u = null
endfunction

//===========================================================================
function InitTrig_Genesis takes nothing returns nothing
    set gg_trg_Genesis = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Genesis, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_Genesis, Condition( function Trig_Genesis_Conditions ) )
    call TriggerAddAction( gg_trg_Genesis, function Trig_Genesis_Actions )
endfunction
