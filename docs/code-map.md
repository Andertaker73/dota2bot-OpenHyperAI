# Code Map — OpenHyperAI

> Gerado automaticamente por `scripts/generate-code-map.js`. Não edite manualmente.

## `bots/FunLib/jmz_func.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `J.SetUserHeroInit` | nAbilityBuildList, nTalentBuildList, sBuyList, sSellList | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 39 |
| `J.GetTalentBuildList` | nLocalList | — | sim | — | 58 |
| `J.HasQueuedAction` | bot | — | sim | bots/mode_team_roam_generic.lua | 83 |
| `J.IsTryingtoUseAbility` | bot | — | sim | bots/ability_item_usage_generic.lua<br>bots/mode_roam_generic.lua | 128 |
| `J.MustReactNow` | bot | — | sim | — | 144 |
| `J.CanNotUseAction` | bot | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/minion_lib/illusions.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua | 209 |
| `J.IsBotBusyChannelingOrStunned` | bot | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 228 |
| `J.CanNotUseAbility` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 242 |
| `J.HasMovableUndyingModifier` | botTarget, nDelay | — | sim | — | 271 |
| `J.GetUnitAllyCountAroundEnemyTarget` | target, nRadius | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_shadow_demon.lua<br>bots/BotLib/hero_warlock.lua | 289 |
| `J.GetAroundTargetEnemyUnitCount` | target, nRadius | — | sim | bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_medusa.lua<br>bots/BotLib/hero_shadow_demon.lua<br>bots/BotLib/hero_shadow_shaman.lua<br>bots/BotLib/hero_sven.lua | 301 |
| `J.GetAroundTargetLocEnemyUnitCount` | targetLoc, nRadius | — | sim | — | 306 |
| `J.GetAroundTargetEnemyHeroCount` | target, nRadius | — | sim | bots/BotLib/hero_jakiro.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_sven.lua | 313 |
| `J.GetNearbyAroundLocationUnitCount` | bEnemy, bHero, nRadius, vLoc | — | sim | bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_earthshaker.lua<br>bots/BotLib/hero_lion.lua<br>bots/BotLib/hero_viper.lua | 321 |
| `J.GetAttackEnemysAllyCreepCount` | target, nRadius | — | sim | bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_shadow_shaman.lua<br>bots/BotLib/hero_skeleton_king.lua<br>bots/BotLib/hero_sven.lua | 363 |
| `J.GetVulnerableWeakestUnit` | bot, bHero, bEnemy, nRadius | — | sim | bots/BotLib/hero_nyx_assassin.lua<br>bots/BotLib/hero_obsidian_destroyer.lua<br>bots/BotLib/hero_pangolier.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_shadow_demon.lua | 382 |
| `J.GetVulnerableUnitNearLoc` | bot, bHero, bEnemy, nCastRange, nRadius, vLoc | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_grimstroke.lua<br>bots/BotLib/hero_zuus.lua<br>bots/FunLib/rubick_hero/arc_warden.lua | 394 |
| `J.GetAoeEnemyHeroLocation` | bot, nCastRange, nRadius, nCount | — | sim | bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_death_prophet.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_kez.lua | 423 |
| `J.IsWithoutTarget` | bot | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_huskar.lua<br>bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_leshrac.lua<br>bots/BotLib/hero_magnataur.lua | 456 |
| `J.GetProperTarget` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 464 |
| `J.IsAllyCanKill` | target | — | sim | — | 490 |
| `J.IsOtherAllyCanKillTarget` | bot, target | — | sim | bots/BotLib/hero_mirana.lua<br>bots/BotLib/hero_sniper.lua<br>bots/BotLib/hero_zuus.lua<br>bots/mode_farm_generic.lua<br>bots/mode_retreat_generic.lua | 529 |
| `J.GetRetreatingAlliesNearLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_winter_wyvern.lua<br>bots/FunLib/aba_defend.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 579 |
| `J.GetAlliesNearLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 603 |
| `J.GetEnemiesNearLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 626 |
| `J.GetAnyEnemiesNearLoc` | vLoc, nRadius | — | sim | — | 649 |
| `J.GetIllusionsNearLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_earthshaker.lua | 669 |
| `J.IsAllyHeroBetweenAllyAndEnemy` | hAlly, hEnemy, vLoc, nRadius | — | sim | bots/BotLib/hero_drow_ranger.lua | 692 |
| `J.IsUnderLongDurationStun` | enemyHero | — | sim | bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_winter_wyvern.lua | 730 |
| `J.GetUltimateAbility` | bot | — | sim | bots/ability_item_usage_generic.lua | 740 |
| `J.CanUseRefresherShard` | bot | — | sim | bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_invoker.lua<br>bots/ability_item_usage_generic.lua | 749 |
| `J.GetMostUltimateCDUnit` | — | — | sim | bots/mode_team_roam_generic.lua | 773 |
| `J.GetPickUltimateScepterUnit` | — | — | sim | — | 807 |
| `J.CanUseRefresherOrb` | bot | — | sim | — | 846 |
| `J.IsNoItemIllution` | bot | — | sim | bots/ability_item_usage_generic.lua | 866 |
| `J.IsNoAbilityIllution` | bot | — | sim | bots/ability_item_usage_generic.lua | 882 |
| `J.IsSuspiciousIllusion` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 900 |
| `J.CanCastAbilityOnTarget` | npcTarget, bIgnoreMagicImmune | — | sim | bots/BotLib/hero_bounty_hunter.lua<br>bots/FunLib/rubick_hero/bounty_hunter.lua | 979 |
| `J.CanCastAbility` | ability | — | sim | bots/BotLib/hero_bloodseeker.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_crystal_maiden.lua | 990 |
| `J.IsTier1` | tower | — | sim | — | 1005 |
| `J.IsTier2` | tower | — | sim | — | 1017 |
| `J.IsTier3p` | tower | — | sim | — | 1029 |
| `J.CanBlinkDagger` | bot | — | sim | bots/BotLib/hero_mars.lua<br>bots/BotLib/hero_tinker.lua | 1043 |
| `J.CanBlackKingBar` | bot | — | sim | bots/BotLib/hero_primal_beast.lua | 1067 |
| `J.CanCastOnMagicImmune` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_beastmaster.lua | 1090 |
| `J.IsNotImmune` | botTarget | — | sim | bots/FunLib/minion_lib/primal_split.lua | 1099 |
| `J.FilterEnemiesForStun` | enemies | — | sim | bots/FunLib/minion_lib/primal_split.lua | 1106 |
| `J.CanCastOnNonMagicImmune` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1117 |
| `J.IsInEtherealForm` | npcTarget | — | sim | bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_morphling.lua<br>bots/BotLib/hero_ringmaster.lua<br>bots/BotLib/hero_rubick.lua<br>bots/BotLib/hero_terrorblade.lua | 1127 |
| `J.CanCastOnTargetAdvanced` | npcTarget | — | sim | bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 1135 |
| `J.CanCastUnitSpellOnTarget` | npcTarget, nDelay | — | sim | — | 1179 |
| `J.CanKillTarget` | npcTarget, dmg, dmgType | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 1195 |
| `J.WillKillTarget` | npcTarget, dmg, dmgType, nDelay | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_dragon_knight.lua | 1206 |
| `J.WillMixedDamageKillTarget` | npcTarget, nPhysicalDamge, nMagicalDamage, nPureDamage, nDelay | — | sim | bots/BotLib/hero_riki.lua | 1220 |
| `J.WillMagicKillTarget` | bot, npcTarget, dmg, nDelay | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_death_prophet.lua | 1239 |
| `J.HasForbiddenModifier` | npcTarget | — | sim | bots/BotLib/hero_legion_commander.lua<br>bots/BotLib/hero_sven.lua<br>bots/BotLib/hero_templar_assassin.lua<br>bots/ability_item_usage_generic.lua | 1287 |
| `J.GetHeroesTargetingUnit` | tUnits, hUnit | — | sim | bots/BotLib/hero_life_stealer.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_rune_generic.lua | 1337 |
| `J.GetSameUnitType` | hUnit, nRadius, sUnitName, bAttacking | — | sim | bots/mode_retreat_generic.lua | 1351 |
| `J.GetUnitListTotalAttackDamage` | bot, tUnits, fTimeInterval | — | sim | bots/mode_retreat_generic.lua | 1371 |
| `J.IsTargetedByEnemyWithModifier` | tUnits, sModifierName | — | sim | bots/mode_retreat_generic.lua | 1410 |
| `J.ShouldEscape` | bot | — | sim | bots/BotLib/hero_queenofpain.lua | 1423 |
| `J.GetClosestTeamLane` | unit | — | sim | bots/FunLib/minion_lib/illusions.lua<br>bots/FunLib/minion_lib/primal_split.lua | 1438 |
| `J.GetFirstBotInTeam` | — | — | sim | bots/mode_side_shop_generic.lua | 1461 |
| `J.GetSpecialUnits` | — | — | sim | bots/FunLib/minion_lib/illusions.lua | 1508 |
| `J.IsDisabled` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1512 |
| `J.IsTaunted` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_beastmaster.lua | 1545 |
| `J.IsInRange` | bot, npcTarget, nRadius | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1558 |
| `J.IsInLocRange` | npcTarget, nLoc, nRadius | — | sim | bots/BotLib/hero_death_prophet.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_lina.lua<br>bots/BotLib/hero_pugna.lua<br>bots/BotLib/hero_riki.lua | 1568 |
| `J.HasItemInInventory` | hItem | — | sim | bots/ability_item_usage_generic.lua | 1577 |
| `J.IsInTeamFight` | bot, nRadius | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 1581 |
| `J.GetItem` | itemName | — | sim | bots/BotLib/hero_tinker.lua<br>bots/FunLib/utils.lua<br>typescript/bots/FunLib/utils.ts | 1591 |
| `J.GetItem2` | bot, sItemName | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/responder_policy.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/jmz_func.d.ts<br>typescript/bots/FunLib/responder_policy.ts | 1606 |
| `J.IsRetreating` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1622 |
| `J.GetAbility` | bot, abilityName | — | sim | — | 1635 |
| `J.IsUnitNearby` | bot, tUnits, nRadius, sUnitName, bHero | — | sim | bots/mode_retreat_generic.lua | 1648 |
| `J.IsGoingOnSomeone` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1668 |
| `IsEnemyTerrorbladeNear` | unit, nRadius | — | não | — | 1680 |
| `GetUnitAttackDamage` | unit, fInterval, bIllusion | — | não | — | 1694 |
| `J.IsDefending` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 1732 |
| `J.IsAnyAllyDefending` | bot, lane | — | sim | typescript/bots/FunLib/jmz_func.d.ts | 1742 |
| `J.IsPushing` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 1760 |
| `J.MultipleAlliesArePushing` | — | — | sim | — | 1770 |
| `J.IsLaning` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua | 1785 |
| `J.IsDoingRoshan` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1792 |
| `J.IsFarming` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 1801 |
| `J.IsShopping` | bot | — | sim | — | 1814 |
| `J.GetTeamFountain` | — | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_dark_seer.lua<br>bots/BotLib/hero_earthshaker.lua<br>bots/BotLib/hero_furion.lua | 1825 |
| `J.GetEnemyFountain` | — | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_kunkka.lua<br>bots/BotLib/hero_marci.lua<br>bots/BotLib/hero_muerta.lua | 1838 |
| `J.GetComboItem` | bot, sItemName | — | sim | bots/BotLib/hero_arc_warden.lua | 1852 |
| `J.HasItem` | bot, sItemName | — | sim | bots/BotLib/hero_hoodwink.lua<br>bots/BotLib/hero_lone_druid_bear.lua<br>bots/BotLib/hero_primal_beast.lua<br>bots/FunLib/aba_item.lua<br>bots/FunLib/aba_site.lua | 1864 |
| `J.FindItemSlotNotInNonbackpack` | bot, sItemName | — | sim | bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_roam_generic.lua | 1874 |
| `J.IsItemAvailable` | sItemName | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_chaos_knight.lua<br>bots/BotLib/hero_crystal_maiden.lua | 1880 |
| `J.GetMostHpUnit` | unitList | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_huskar.lua | 1894 |
| `J.GetLeastHpUnit` | unitList | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_sven.lua | 1916 |
| `J.IsAllowedToSpam` | bot, nManaCost | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bloodseeker.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_dazzle.lua | 1936 |
| `J.IsAllyUnitSpell` | sAbilityName | — | sim | bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_slark.lua | 1947 |
| `J.IsProjectileUnitSpell` | sAbilityName | — | sim | bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_slark.lua | 1954 |
| `J.IsOnlyProjectileSpell` | sAbilityName | — | sim | — | 1962 |
| `J.IsStunProjectileSpell` | sAbilityName | — | sim | — | 1969 |
| `J.IsWillBeCastUnitTargetSpell` | bot, nRadius | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_life_stealer.lua<br>bots/BotLib/hero_morphling.lua<br>bots/BotLib/hero_nyx_assassin.lua | 1976 |
| `J.IsWillBeCastPointSpell` | bot, nRadius | — | sim | bots/BotLib/hero_life_stealer.lua<br>bots/ability_item_usage_generic.lua | 2019 |
| `J.IsProjectileIncoming` | bot, range | — | sim | bots/ability_item_usage_generic.lua | 2048 |
| `J.IsUnitTargetProjectileIncoming` | bot, range | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_morphling.lua<br>bots/BotLib/hero_nyx_assassin.lua<br>bots/BotLib/hero_pangolier.lua | 2073 |
| `J.IsStunProjectileIncoming` | bot, range | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_dark_willow.lua<br>bots/BotLib/hero_ember_spirit.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_furion.lua | 2102 |
| `J.IsAttackProjectileIncoming` | bot, range | — | sim | bots/ability_item_usage_generic.lua | 2122 |
| `J.IsNotAttackProjectileIncoming` | bot, range | — | sim | bots/BotLib/hero_juggernaut.lua<br>bots/BotLib/hero_life_stealer.lua<br>bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_riki.lua<br>bots/BotLib/hero_sand_king.lua | 2140 |
| `J.GetAttackProDelayTime` | bot, nCreep | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_huskar.lua<br>bots/BotLib/hero_silencer.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_laning_generic.lua | 2163 |
| `J.GetCreepAttackActivityWillRealDamage` | nUnit, nTime | — | sim | — | 2230 |
| `J.GetCreepAttackProjectileWillRealDamage` | nUnit, nTime | — | sim | bots/mode_team_roam_generic.lua | 2291 |
| `J.GetTotalAttackWillRealDamage` | nUnit, nTime | — | sim | bots/BotLib/hero_silencer.lua | 2316 |
| `J.GetAttackProjectileDamageByRange` | nUnit, nRadius | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_leshrac.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_necrolyte.lua<br>bots/BotLib/hero_phantom_lancer.lua | 2323 |
| `J.GetCorrectLoc` | npcTarget, fDelay | — | sim | bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_earth_spirit.lua<br>bots/BotLib/hero_elder_titan.lua | 2341 |
| `J.GetDistanceFromLaneFront` | bot | — | sim | — | 2366 |
| `J.GetEscapeLoc` | — | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_dawnbreaker.lua<br>bots/BotLib/hero_earth_spirit.lua<br>bots/BotLib/hero_ember_spirit.lua<br>bots/BotLib/hero_faceless_void.lua | 2370 |
| `J.IsStuck2` | bot | — | sim | — | 2390 |
| `J.IsStuck` | bot | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_broodmother.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_earth_spirit.lua | 2409 |
| `J.IsExistInTable` | u, tUnit | — | sim | bots/BotLib/hero_medusa.lua<br>bots/FunLib/aba_item.lua | 2433 |
| `J.CombineTwoTable` | tableA, tableB | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_jakiro.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_riki.lua | 2448 |
| `J.GetInvUnitInLocCount` | bot, nRadius, nFindRadius, vLocation, pierceImmune | — | sim | bots/BotLib/hero_bloodseeker.lua<br>bots/BotLib/hero_medusa.lua<br>bots/FunLib/rubick_hero/bloodseeker.lua | 2462 |
| `J.GetInLocLaneCreepCount` | bot, nRadius, nFindRadius, vLocation | — | sim | bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_silencer.lua<br>bots/BotLib/hero_sniper.lua | 2481 |
| `J.GetInvUnitCount` | pierceImmune, unitList | — | sim | bots/BotLib/hero_zuus.lua | 2498 |
| `J.HasHealingItem` | bot | — | sim | bots/mode_roam_generic.lua | 2517 |
| `J.ShouldGoFarmDuringLaning` | bot | — | sim | bots/mode_laning_generic.lua | 2523 |
| `J.GetDistanceFromEnemyFountain` | bot | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_drow_ranger.lua<br>bots/FunLib/rubick_hero/arc_warden.lua<br>bots/mode_farm_generic.lua<br>bots/mode_retreat_generic.lua | 2537 |
| `J.GetDistanceFromAllyFountain` | bot | — | sim | bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_riki.lua | 2547 |
| `J.GetDistanceFromAncient` | bot, bEnemy | — | sim | bots/FunLib/aba_special_units.lua<br>bots/FunLib/utils.lua<br>bots/mode_laning_generic.lua<br>bots/mode_retreat_generic.lua<br>typescript/bots/FunLib/utils.ts | 2557 |
| `J.GetAroundTargetAllyHeroCount` | target, nRadius | — | sim | bots/BotLib/hero_necrolyte.lua<br>bots/ability_item_usage_generic.lua | 2568 |
| `J.GetAroundTargetOtherAllyHeroCount` | bot, target, nRadius | — | sim | bots/ability_item_usage_generic.lua | 2577 |
| `J.GetAllyCreepNearLoc` | bot, vLoc, nRadius | — | sim | — | 2591 |
| `J.GetAllyUnitCountAroundEnemyTarget` | bot, target, nRadius | — | sim | bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_silencer.lua<br>bots/FunLib/rubick_hero/crystal_maiden.lua | 2611 |
| `J.GetNearbyHeroes` | bot, nRadius, bEnemy, bBotMode | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 2645 |
| `J.GetAroundBotUnitList` | bot, nRadius, bEnemy | — | sim | bots/BotLib/hero_bounty_hunter.lua<br>bots/FunLib/rubick_hero/bounty_hunter.lua | 2695 |
| `J.GetLocationToLocationDistance` | fLoc, sLoc | — | sim | bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_centaur.lua<br>bots/BotLib/hero_elder_titan.lua<br>bots/BotLib/hero_muerta.lua | 2722 |
| `J.GetUnitTowardDistanceLocation` | bot, towardTarget, nDistance | — | sim | bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_pugna.lua<br>bots/BotLib/hero_riki.lua<br>bots/BotLib/hero_sand_king.lua | 2734 |
| `J.GetLocationTowardDistanceLocation` | bot, towardLocation, nDistance | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_pugna.lua<br>bots/BotLib/hero_riki.lua | 2744 |
| `J.GetFaceTowardDistanceLocation` | bot, nDistance | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_juggernaut.lua<br>bots/BotLib/hero_kunkka.lua<br>bots/BotLib/hero_nevermore.lua<br>bots/BotLib/hero_phantom_lancer.lua | 2754 |
| `J.SetBotPing` | vLoc | — | sim | — | 2765 |
| `J.SetBotPrint` | sMessage, vLoc, bReport, bPing | — | sim | bots/BotLib/hero_silencer.lua | 2772 |
| `J.SetReportMotive` | bDebugFile, sMotive | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_death_prophet.lua | 2794 |
| `J.GetCastLocation` | bot, npcTarget, nCastRange, nRadius | — | sim | bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_death_prophet.lua<br>bots/BotLib/hero_legion_commander.lua<br>bots/BotLib/hero_queenofpain.lua<br>bots/BotLib/hero_silencer.lua | 2812 |
| `J.GetDelayCastLocation` | bot, npcTarget, nCastRange, nRadius, nTime | — | sim | bots/BotLib/hero_bloodseeker.lua<br>bots/BotLib/hero_lina.lua<br>bots/BotLib/hero_lion.lua<br>bots/BotLib/hero_pugna.lua<br>bots/BotLib/hero_riki.lua | 2848 |
| `J.GetOne` | number | — | sim | bots/BotLib/hero_silencer.lua | 2868 |
| `J.GetTwo` | number | — | sim | — | 2875 |
| `J.SetQueueToInvisible` | bot | — | sim | bots/BotLib/hero_bane.lua<br>bots/FunLib/rubick_hero/bane.lua | 2882 |
| `J.SetQueueSwitchPtToINT` | bot | — | sim | bots/mode_farm_generic.lua | 2927 |
| `J.SetQueueUseSoulRing` | bot | — | sim | — | 2947 |
| `J.SetQueuePtToINT` | bot, bSoulRingUsed | — | sim | bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 2968 |
| `J.IsPTReady` | bot, status | — | sim | bots/mode_farm_generic.lua | 2982 |
| `J.ShouldSwitchPTStat` | bot, pt | — | sim | bots/ability_item_usage_generic.lua | 3015 |
| `J.IsOtherAllysTarget` | unit | — | sim | bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_largo.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_mirana.lua | 3041 |
| `J.IsAllysTarget` | unit | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_huskar.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_shadow_shaman.lua | 3065 |
| `J.ToNearest500` | num | — | sim | — | 3085 |
| `J.ToNearest1000` | num | — | sim | — | 3090 |
| `J.IsKeyWordUnit` | keyWord, uUnit | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_bounty_hunter.lua | 3094 |
| `J.IsHumanPlayer` | nUnit | — | sim | bots/ability_item_usage_generic.lua | 3105 |
| `J.IsValid` | nTarget | — | sim | bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 3112 |
| `J.IsValidTarget` | nTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 3120 |
| `J.IsValidHero` | nTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 3125 |
| `J.IsValidBuilding` | nTarget | — | sim | bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_death_prophet.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_drow_ranger.lua | 3129 |
| `J.IsRoshan` | nTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_arc_warden.lua | 3133 |
| `J.IsMoving` | bot | — | sim | bots/BotLib/hero_dark_willow.lua<br>bots/BotLib/hero_kunkka.lua<br>bots/BotLib/hero_lone_druid.lua<br>bots/BotLib/hero_lone_druid_bear.lua<br>bots/BotLib/hero_muerta.lua | 3144 |
| `J.IsRunning` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_batrider.lua | 3159 |
| `J.IsAttacking` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_arc_warden.lua | 3168 |
| `J.IsChasingTarget` | bot, nTarget | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_bounty_hunter.lua | 3187 |
| `J.IsRealInvisible` | bot | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua | 3202 |
| `J.GetModifierTime` | bot, sModifierName | — | sim | bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_largo.lua | 3224 |
| `J.GetModifierCount` | bot, sModifierName | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_lion.lua<br>bots/BotLib/hero_nevermore.lua<br>bots/BotLib/hero_primal_beast.lua<br>bots/BotLib/hero_shadow_demon.lua | 3242 |
| `J.GetUniqueModifierCount` | bot, sModifierName | — | sim | bots/BotLib/hero_oracle.lua | 3260 |
| `J.GetRemainStunTime` | bot | — | sim | bots/BotLib/hero_mirana.lua | 3280 |
| `J.IsTeamActivityCount` | bot, nCount | — | sim | bots/mode_farm_generic.lua | 3298 |
| `J.GetSpecialModeAllies` | bot, nDistance, nMode | — | sim | bots/BotLib/hero_mars.lua<br>bots/BotLib/hero_phoenix.lua<br>bots/BotLib/hero_windrunner.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/mode_team_roam_generic.lua | 3318 |
| `J.GetSpecialModeAlliesCount` | nMode | — | sim | — | 3340 |
| `J.GetTeamFightLocation` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_centaur.lua<br>bots/BotLib/hero_chen.lua<br>bots/BotLib/hero_dark_willow.lua | 3349 |
| `J.GetTeamFightAlliesCount` | bot | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_silencer.lua | 3378 |
| `J.GetCenterOfUnits` | nUnits | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_beastmaster.lua | 3399 |
| `J.GetMostFarmLaneDesire` | bot | — | sim | bots/BotLib/hero_tinker.lua<br>bots/ability_item_usage_generic.lua | 3424 |
| `J.GetMostDefendLaneDesire` | — | — | sim | bots/BotLib/hero_furion.lua<br>bots/mode_farm_generic.lua<br>bots/mode_team_roam_generic.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 3449 |
| `J.GetDefendLaneDesire` | lane | — | sim | bots/FunLib/aba_defend.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/ts_libs/dota/globals.d.ts | 3473 |
| `J.IsT3TowerDown` | team, lane | — | sim | — | 3482 |
| `J.IsPingCloseToValidTower` | nTeam, ping, nRadius, fInterval | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 3492 |
| `J.IsRoshanCloseToChangingSides` | — | — | sim | bots/ability_item_usage_generic.lua<br>bots/mode_roshan_generic.lua | 3530 |
| `J.GetMostPushLaneDesire` | — | — | sim | bots/mode_team_roam_generic.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 3534 |
| `J.GetClosestAlly` | bot, nRadius | — | sim | bots/mode_team_roam_generic.lua | 3554 |
| `J.GetNearestLaneFrontLocation` | nUnitLoc, bEnemy, fDeltaFromFront | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/FunLib/rubick_hero/arc_warden.lua<br>bots/ability_item_usage_generic.lua | 3572 |
| `J.GetAttackableWeakestUnit` | bot, nRadius, bHero, bEnemy | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_chen.lua<br>bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_huskar.lua<br>bots/BotLib/hero_lich.lua | 3599 |
| `J.GetAttackableWeakestUnitFromList` | bot, unitList | — | sim | bots/mode_roam_generic.lua | 3611 |
| `J.CannotBeKilled` | bot, botTarget | — | sim | bots/BotLib/hero_dazzle.lua | 3652 |
| `J.CanIgnoreLowHp` | bot | — | sim | bots/mode_team_roam_generic.lua | 3664 |
| `J.ScoreEnemyTarget` | bot, enemy, alliesNearby | — | sim | — | 3676 |
| `J.GetBestTeamTarget` | bot, enemyHeroes, allyHeroes | — | sim | — | 3761 |
| `J.CanBeAttacked` | unit | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_broodmother.lua | 3799 |
| `J.GetHP` | unit | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 3821 |
| `J.GetEffectiveHP` | bot | — | sim | — | 3832 |
| `J.GetMP` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_batrider.lua | 3854 |
| `J.GetAllyList` | bot, nRadius | — | sim | bots/BotLib/hero_sven.lua<br>bots/ability_item_usage_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_team_roam_generic.lua | 3862 |
| `J.GetAllyCount` | bot, nRadius | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_razor.lua<br>bots/ability_item_usage_generic.lua<br>bots/mode_farm_generic.lua | 3884 |
| `J.GetAroundEnemyHeroList` | nRadius | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_ember_spirit.lua | 3893 |
| `J.GetAroundCreepList` | nRadius, bEnemy, bNeutral, bLaneCreep | — | sim | — | 3902 |
| `J.GetAroundBuildingList` | nRadius, bEnemy, bTower, bShrine, bFiller, bBarrack, bAcient | — | sim | — | 3923 |
| `J.GetEnemyList` | bot, nRadius | — | sim | bots/BotLib/hero_chaos_knight.lua<br>bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_jakiro.lua<br>bots/BotLib/hero_kunkka.lua<br>bots/BotLib/hero_lich.lua | 3940 |
| `J.GetEnemyCount` | bot, nRadius | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_medusa.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_razor.lua<br>bots/ability_item_usage_generic.lua | 3961 |
| `J.ConsiderTarget` | — | — | sim | bots/BotLib/hero_luna.lua<br>bots/BotLib/hero_medusa.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_nevermore.lua<br>bots/BotLib/hero_sniper.lua | 3969 |
| `J.IsHaveAegis` | bot | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_lina.lua | 3996 |
| `J.DoesTeamHaveAegis` | — | — | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/global_cache.ts | 4000 |
| `J.GetCoresAverageNetworth` | — | — | sim | bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_laning_generic.lua<br>bots/mode_side_shop_generic.lua | 4022 |
| `J.GetCoresMaxNetworth` | — | — | sim | — | 4045 |
| `J.IsLocHaveTower` | nRadius, bEnemy, nLoc | — | sim | bots/ability_item_usage_generic.lua | 4068 |
| `J.GetNearbyLocationToTp` | nLoc | — | sim | bots/BotLib/hero_tinker.lua<br>bots/ability_item_usage_generic.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 4093 |
| `J.IsEnemyFacingUnit` | bot, nRadius, nDegrees | — | sim | bots/ability_item_usage_generic.lua | 4139 |
| `J.IsAllyFacingUnit` | bot, nRadius, nDegrees | — | sim | — | 4159 |
| `J.IsEnemyTargetUnit` | nUnit, nRadius | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_zuus.lua | 4180 |
| `J.IsCastingUltimateAbility` | bot | — | sim | bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_centaur.lua<br>bots/BotLib/hero_dark_willow.lua<br>bots/BotLib/hero_dawnbreaker.lua<br>bots/BotLib/hero_earth_spirit.lua | 4198 |
| `J.IsInAllyArea` | bot | — | sim | bots/mode_farm_generic.lua | 4215 |
| `J.IsInEnemyArea` | bot | — | sim | bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_sven.lua<br>bots/BotLib/hero_templar_assassin.lua<br>bots/FunLib/rubick_hero/bounty_hunter.lua | 4230 |
| `J.IsAnyAllyHeroSurroundedByManyAllies` | — | — | sim | — | 4245 |
| `J.IsAllyHeroAroundLocation` | vLoc, nRadius | — | sim | — | 4262 |
| `J.IsEnemyHeroAroundLocation` | vLoc, nRadius | — | sim | bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/ability_item_usage_generic.lua | 4280 |
| `J.GetLastSeenEnemiesNearLoc` | vLoc, nRadius | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/responder_policy.lua<br>bots/mode_farm_generic.lua<br>bots/mode_roshan_generic.lua | 4307 |
| `J.GetNumOfAliveHeroes` | bEnemy | — | sim | bots/BotLib/hero_mirana.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_queenofpain.lua<br>bots/BotLib/hero_riki.lua<br>bots/FunLib/aba_defend.lua | 4334 |
| `J.GetNumOfHeroesNearLocation` | bEnemy, location, distance | — | sim | — | 4356 |
| `J.GetHeroesNearLocation` | bEnemy, location, distance | — | sim | bots/BotLib/hero_elder_titan.lua<br>bots/BotLib/hero_invoker.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 4368 |
| `J.GetAverageLevel` | bEnemy | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/aba_defend.ts | 4381 |
| `J.GetNumOfTeamTotalKills` | bEnemy | — | sim | bots/ability_item_usage_generic.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 4404 |
| `J.IsEarlyGame` | — | — | sim | bots/BotLib/hero_chaos_knight.lua<br>bots/BotLib/hero_morphling.lua<br>bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/aba_ward_utility.lua | 4424 |
| `J.IsMidGame` | — | — | sim | bots/BotLib/hero_chaos_knight.lua<br>bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua | 4431 |
| `J.IsLateGame` | — | — | sim | bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_mars.lua<br>bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua | 4438 |
| `J.DotProduct` | A, B | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_marci.lua<br>bots/BotLib/hero_mars.lua | 4445 |
| `J.ConsiderForMkbDisassembleMask` | bot | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_medusa.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_razor.lua<br>bots/BotLib/hero_sniper.lua | 4449 |
| `J.HasNotActionLast` | nCD, nNumber | — | sim | bots/mode_farm_generic.lua | 4519 |
| `J.GetCastDelay` | bot, unit, nPointTime, nProjectSpeed | — | sim | — | 4534 |
| `J.CanBreakTeleport` | bot, unit, nPointTime, nProjectSpeed | — | sim | — | 4546 |
| `J.CanBeCast` | ability | — | sim | bots/BotLib/hero_nyx_assassin.lua | 4559 |
| `J.CanSpamSpell` | bot, manaCost | — | sim | bots/BotLib/hero_tiny.lua | 4563 |
| `J.GetProperCastRange` | bIgnore, hUnit, abilityCR | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_brewmaster.lua | 4573 |
| `J.GetLowestHPUnit` | tUnits, bIgnoreImmune | — | sim | — | 4588 |
| `J.AllowedToSpam` | bot, manaCost | — | sim | bots/BotLib/hero_ember_spirit.lua | 4603 |
| `J.CountVulnerableUnit` | tUnits, locAOE, nRadius, nUnits | — | sim | — | 4607 |
| `J.GetProperLocation` | hUnit, nDelay | — | sim | — | 4620 |
| `J.CountNotStunnedUnits` | tUnits, locAOE, nRadius, nUnits | — | sim | bots/BotLib/hero_snapfire.lua | 4627 |
| `J.CountInvUnits` | pierceImmune, units | — | sim | — | 4640 |
| `J.GetMostHPPercent` | listUnits, magicImmune | — | sim | bots/BotLib/hero_terrorblade.lua | 4652 |
| `J.HasAghanimsShard` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_earth_spirit.lua<br>bots/BotLib/hero_pugna.lua | 4668 |
| `J.GetCanBeKilledUnit` | units, nDamage, nDmgType, magicImmune | — | sim | bots/BotLib/hero_earth_spirit.lua | 4672 |
| `J.GetClosestUnit` | units | — | sim | bots/BotLib/hero_earth_spirit.lua | 4685 |
| `J.IsModeTurbo` | — | — | sim | bots/BotLib/hero_alchemist.lua<br>bots/FunLib/aba_site.lua<br>bots/FunLib/rubick_hero/alchemist.lua<br>bots/FunLib/utils.lua<br>bots/ability_item_usage_generic.lua | 4693 |
| `J.IsCore` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_chen.lua | 4709 |
| `J.IsPosxHuman` | x | — | sim | bots/mode_laning_generic.lua | 4714 |
| `J.GetCoresTotalNetworth` | — | — | sim | — | 4728 |
| `J.GetPosition` | bot | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_item.lua<br>bots/FunLib/aba_role.lua<br>bots/FunLib/aba_site.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 4736 |
| `GetEffectiveHealthFromArmor` | nHealth, fArmor | — | não | — | 4748 |
| `GetHealthMultiplier` | hUnit | — | não | — | 4753 |
| `J.WeAreStronger` | bot, nRadius | — | sim | bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_earth_spirit.lua<br>bots/BotLib/hero_ember_spirit.lua<br>bots/BotLib/hero_enchantress.lua<br>bots/BotLib/hero_grimstroke.lua | 4775 |
| `J.CanCastAbilitySoon` | ability, fTime | — | sim | — | 4880 |
| `J.GetManaThreshold` | bot, nManaCost, hAbilityList | — | sim | bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_largo.lua<br>bots/BotLib/hero_life_stealer.lua | 4900 |
| `J.CheckLoneDruid` | — | — | sim | bots/mode_farm_generic.lua | 4935 |
| `J.RandomForwardVector` | length | — | sim | bots/FunLib/aba_defend.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 4950 |
| `J.GetUnitWithMinDistanceToLoc` | hUnit, hUnits, cUnits, fMinDist, vLoc | — | sim | — | 4967 |
| `J.GetUnitWithMaxDistanceToLoc` | hUnit, hUnits, cUnits, fMinDist, vLoc | — | sim | — | 4985 |
| `J.GetFurthestUnitToLocationFrommAll` | hUnit, nRange, vLoc | — | sim | bots/BotLib/hero_tiny.lua | 5003 |
| `J.GetClosestUnitToLocationFrommAll` | hUnit, nRange, vLoc | — | sim | — | 5024 |
| `J.GetClosestUnitToLocationFrommAll2` | hUnit, nRange, vLoc | — | sim | bots/BotLib/hero_tiny.lua | 5045 |
| `J.CheckTimeOfDay` | — | — | sim | bots/BotLib/hero_lycan.lua<br>bots/BotLib/hero_night_stalker.lua<br>bots/ability_item_usage_generic.lua<br>bots/mode_roshan_generic.lua | 5066 |
| `J.GetArmorReducers` | hero | — | sim | — | 5076 |
| `J.IsRoshanAlive` | — | — | sim | bots/ability_item_usage_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roshan_generic.lua | 5118 |
| `J.HasEnoughDPSForRoshan` | heroes | — | sim | bots/mode_roshan_generic.lua | 5133 |
| `J.IsNotSelf` | bot, ally | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_rattletrap.lua<br>bots/BotLib/hero_spectre.lua<br>bots/BotLib/hero_winter_wyvern.lua | 5163 |
| `J.IsThereNonSelfCoreNearby` | nRadius | — | sim | bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_earthshaker.lua<br>bots/BotLib/hero_grimstroke.lua<br>bots/BotLib/hero_hoodwink.lua<br>bots/BotLib/hero_kez.lua | 5172 |
| `J.GetAliveAllyCoreCount` | — | — | sim | bots/mode_side_shop_generic.lua | 5192 |
| `J.GetStrongestUnit` | nRange, hUnit, bEnemy, bMagicImune, fTime | — | sim | bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_enchantress.lua<br>bots/BotLib/hero_grimstroke.lua<br>bots/BotLib/hero_gyrocopter.lua | 5207 |
| `J.GetStrongestEnemyHero` | enemies | — | sim | bots/FunLib/minion_lib/primal_split.lua | 5229 |
| `J.GetDistance` | s, t | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_mars.lua<br>bots/BotLib/hero_rattletrap.lua<br>bots/BotLib/hero_techies.lua<br>bots/BotLib/hero_tinker.lua | 5244 |
| `J.IsHeroBetweenMeAndLocation` | hSource, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5248 |
| `J.IsEnemyBetweenMeAndLocation` | hSource, vLoc, nRadius | — | sim | bots/BotLib/hero_magnataur.lua | 5277 |
| `J.IsHeroBetweenMeAndTarget` | hSource, hTarget, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5296 |
| `J.IsCreepBetweenMeAndLocation` | hSource, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5323 |
| `J.IsUnitBetweenMeAndLocation` | hSource, hTarget, vTargetLoc, nRadius | — | sim | bots/BotLib/hero_pudge.lua<br>bots/BotLib/hero_rattletrap.lua<br>bots/BotLib/hero_ringmaster.lua | 5346 |
| `J.IsNonSiegeCreepBetweenMeAndLocation` | hSource, vLoc, nRadius | — | sim | — | 5367 |
| `J.IsThereCoreNearby` | nRadius | — | sim | bots/BotLib/hero_jakiro.lua<br>bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_morphling.lua<br>bots/BotLib/hero_pudge.lua<br>bots/BotLib/hero_venomancer.lua | 5396 |
| `J.GetClosestCore` | bot, nRadius | — | sim | bots/mode_team_roam_generic.lua | 5412 |
| `J.IsCreepBetweenMeAndTarget` | hSource, hTarget, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5431 |
| `J.IsAllyHeroBetweenMeAndTarget` | hSource, hTarget, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5519 |
| `J.DidEnemyCastAbility` | — | — | sim | bots/BotLib/hero_dark_willow.lua | 5570 |
| `J.GetWeakestUnit` | nEnemyUnits | — | sim | bots/BotLib/hero_dark_willow.lua<br>bots/FunLib/minion_lib/primal_split.lua | 5608 |
| `J.HasInvisibilityOrItem` | npcEnemy | — | sim | bots/ability_item_usage_generic.lua | 5612 |
| `J.HasEnemyIceSpireNearby` | bot, nRange | — | sim | bots/mode_roam_generic.lua | 5627 |
| `J.AnyAllyAffectedByChainFrost` | bot, nRange | — | sim | bots/mode_roam_generic.lua | 5645 |
| `J.AdjustLocationWithOffset` | vLoc, offset, target | — | sim | — | 5665 |
| `J.AdjustLocationWithOffsetTowardsFountain` | loc, distance | — | sim | bots/FunLib/aba_defend.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 5677 |
| `J.IsInLaningPhase` | — | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua | 5681 |
| `J.IsTormentor` | nTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_arc_warden.lua | 5696 |
| `J.IsDoingTormentor` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 5704 |
| `J.IsLocationInChrono` | loc | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_broodmother.lua<br>bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_faceless_void.lua | 5708 |
| `J.IsLocationInBlackHole` | loc | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_broodmother.lua<br>bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_invoker.lua | 5734 |
| `J.IsEnemyChronosphereInLocation` | loc | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_phoenix.lua<br>bots/BotLib/hero_primal_beast.lua<br>bots/BotLib/hero_windrunner.lua<br>bots/mode_roam_generic.lua | 5750 |
| `J.IsEnemyBlackHoleInLocation` | loc | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_phoenix.lua<br>bots/BotLib/hero_primal_beast.lua<br>bots/BotLib/hero_windrunner.lua<br>bots/mode_roam_generic.lua | 5766 |
| `J.IsLocationInArena` | loc, radius | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_mars.lua<br>bots/BotLib/hero_rattletrap.lua<br>bots/BotLib/hero_undying.lua | 5783 |
| `J.GetMeepos` | — | — | sim | bots/BotLib/hero_meepo.lua | 5810 |
| `J.IsMeepoClone` | hero | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_life_stealer.lua<br>bots/BotLib/hero_marci.lua | 5826 |
| `J.DoesSomeoneHaveModifier` | nUnitList, modifierName | — | sim | bots/BotLib/hero_phoenix.lua | 5854 |
| `J.NumHumanBotPlayersInTeam` | — | — | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/aba_role.lua<br>bots/FunLib/utils.lua<br>bots/mode_farm_generic.lua<br>bots/mode_laning_generic.lua | 5868 |
| `J.GetEnemiesAroundAncient` | bot, nRadius | — | sim | bots/mode_laning_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_roshan_generic.lua<br>bots/mode_side_shop_generic.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 5883 |
| `J.DoesUnitHaveTemporaryBuff` | hUnit | — | sim | bots/mode_side_shop_generic.lua | 5887 |
| `J.GetEnemiesAroundLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_invoker.lua<br>bots/FunLib/aba_push.lua<br>bots/ability_item_usage_generic.lua<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 5905 |
| `J.GetInventoryNetworth` | — | — | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/global_cache.ts | 5974 |
| `J.FindEnemyUnit` | name | — | sim | bots/mode_roam_generic.lua | 6023 |
| `J.GetHumanPing` | — | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/utils.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_roshan_generic.lua | 6036 |
| `J.IsStaleARDMHero` | cachedBot, cachedName | — | sim | bots/ability_item_usage_generic.lua<br>bots/item_purchase_generic.lua | 6060 |
| `J.ModeAnnounce` | bot, locKey, cooldown | — | sim | bots/mode_assemble_generic.lua<br>bots/mode_roshan_generic.lua | 6089 |
| `J.HasAbility` | bot, abilityName | — | sim | bots/BotLib/hero_brewmaster.lua<br>bots/FretBots/DataTables.lua | 6101 |
| `J.IsHumanInLoc` | vLoc, nRadius | — | sim | — | 6115 |
| `J.GetCurrentRoshanLocation` | — | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_dark_seer.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_furion.lua | 6132 |
| `J.GetTormentorLocation` | team | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_dark_seer.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_furion.lua | 6142 |
| `J.GetTormentorWaitingLocation` | team | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>bots/mode_side_shop_generic.lua<br>typescript/bots/FunLib/aba_defend.ts | 6152 |
| `J.IsClosestToDustLocation` | bot, loc | — | sim | bots/ability_item_usage_generic.lua | 6163 |
| `J.GetXUnitsTowardsLocation2` | iLoc, tLoc, nUnits | — | sim | bots/ability_item_usage_generic.lua | 6194 |
| `J.IsUnitWillGoInvisible` | unit | — | sim | bots/ability_item_usage_generic.lua | 6199 |
| `J.HasInvisCounterBuff` | unit | — | sim | bots/ability_item_usage_generic.lua | 6217 |
| `J.GetUnderlordPortal` | — | — | sim | — | 6231 |
| `J.GetTotalEstimatedDamageToTarget` | nUnits, target | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_life_stealer.lua<br>bots/BotLib/hero_mars.lua | 6261 |
| `J.GetAliveCoreCount` | nEnemy | — | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/global_cache.ts | 6277 |
| `J.GetEnemyCountInLane` | lane | — | sim | bots/mode_roam_generic.lua | 6303 |
| `J.GetAllyCountInLane` | lane, nRadius | — | sim | — | 6329 |
| `J.GetManaAfter` | manaCost | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_brewmaster.lua | 6346 |
| `J.GetHealthAfter` | hpCost | — | sim | bots/BotLib/hero_enigma.lua<br>bots/ability_item_usage_generic.lua | 6350 |
| `J.GetCreepListAroundTargetCanKill` | target, nRadius, damage, bEnemy, bNeutral, bLaneCreep | — | sim | bots/BotLib/hero_tinker.lua | 6355 |
| `J.GetPushTPLocation` | nLane | — | sim | bots/BotLib/hero_tinker.lua<br>bots/ability_item_usage_generic.lua | 6426 |
| `J.GetDefendTPLocation` | nLane | — | sim | bots/BotLib/hero_tinker.lua<br>bots/ability_item_usage_generic.lua | 6435 |
| `J.GetRandomLocationWithinDist` | sLoc, minDist, maxDist | — | sim | bots/BotLib/hero_techies.lua<br>bots/BotLib/hero_tinker.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/minion_lib/illusions.lua<br>typescript/bots/FunLib/aba_push.ts | 6439 |
| `J.GetHeroCountAttackingTarget` | nUnits, target | — | sim | bots/BotLib/hero_chen.lua<br>bots/FunLib/rubick_hero/chen.lua | 6447 |
| `J.GetHighestRightClickDamageHero` | nUnits | — | sim | — | 6465 |
| `J.IsBigCamp` | nUnits | — | sim | bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_viper.lua<br>bots/FunLib/rubick_hero/clinkz.lua | 6485 |
| `J.GetETAWithAcceleration` | dist, speed, accel | — | sim | bots/BotLib/hero_techies.lua | 6503 |
| `J.GetTechiesMines` | — | — | sim | — | 6507 |
| `J.GetTechiesMinesInLoc` | loc, nRadius | — | sim | bots/BotLib/hero_techies.lua | 6522 |
| `J.CheckBitfieldFlag` | bitfield, flag | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_techies.lua<br>bots/FunLib/minion_lib/minion_with_skill.lua | 6538 |
| `J.GetPowerCogsCountInLoc` | loc, nRadius | — | sim | bots/FunLib/aba_special_units.lua | 6542 |
| `J.HasPowerTreads` | bot | — | sim | bots/BotLib/hero_luna.lua<br>bots/BotLib/hero_viper.lua | 6557 |
| `J.GetLanePartner` | bot | — | sim | bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/item_purchase_generic.lua | 6569 |
| `J.IsEnemyHero` | hero | — | sim | — | 6591 |
| `J.AddAvoidanceZone` | locationR, durationSec | — | sim | — | 6603 |
| `J.GetClosestAllyHero` | bot | — | sim | — | 6616 |
| `J.hasValue` | tab, val | — | sim | — | 6635 |
| `J.CheckBotIdleState` | — | — | sim | bots/mode_team_roam_generic.lua | 6650 |
| `J.AreTreesBetween` | bot, loc, r | — | sim | bots/BotLib/hero_shredder.lua | 6720 |
| `J.VectorTowards` | vStart, vTowards, nDistance | — | sim | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/ability_item_usage_generic.lua | 6757 |
| `J.VectorAway` | vStart, vTowards, nDistance | — | sim | bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_keeper_of_the_light.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_attack_generic.lua | 6762 |
| `J.GetAngleFromDotProduct` | dot | — | sim | — | 6767 |
| `J.IsUnitTargetedByTower` | hUnit, bTeam | — | sim | bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_largo.lua | 6771 |
| `J.GetBestRetreatTree` | bot, nCastRange | — | sim | bots/BotLib/hero_shredder.lua | 6784 |
| `J.GetBestTree` | bot, enemyLoc, enemy, nCastRange, hitRadios | — | sim | bots/BotLib/hero_shredder.lua | 6814 |
| `J.GetUltLoc` | bot, target, nManaCost, nCastRange, s | — | sim | bots/BotLib/hero_shredder.lua | 6854 |

## `bots/mode_assemble_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 15 |
| `OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_attack_generic.lua<br>bots/mode_farm_generic.lua | 49 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 54 |

## `bots/mode_assemble_with_humans_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 5 |

## `bots/mode_attack_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `IsValidUnit` | hUnit | — | não | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_axe.lua | 32 |
| `Generic.OnStart` | — | — | não | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_roam_generic.lua | 36 |
| `Generic.OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_farm_generic.lua | 37 |
| `GetActualDesire` | nDesire | — | não | bots/FunLib/override_generic/mode_attack_generic.lua | 42 |
| `Generic.GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 49 |
| `Generic.Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 171 |
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 262 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 263 |
| `OnStart` | — | — | não | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_roam_generic.lua | 264 |
| `OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_farm_generic.lua | 265 |
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 267 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 268 |
| `OnStart` | — | — | não | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_roam_generic.lua | 269 |
| `OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_farm_generic.lua | 270 |

## `bots/mode_defend_tower_bot_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 10 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 11 |

## `bots/mode_defend_tower_mid_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 10 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 11 |

## `bots/mode_defend_tower_top_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 10 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 11 |

## `bots/mode_laning_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 32 |
| `GetFurthestEnemyAttackRange` | enemyList | — | não | bots/FunLib/override_generic/mode_laning_generic.lua | 146 |
| `GetBestLastHitCreep` | hCreepList | — | não | bots/FunLib/override_generic/mode_laning_generic.lua | 160 |
| `GetBestDenyCreep` | hCreepList | — | não | bots/FunLib/override_generic/mode_laning_generic.lua | 198 |
| `GetBestHarassTarget` | nEnemyList, nRange | — | não | — | 261 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 309 |
| `PickOneAnnouncer` | — | — | não | bots/mode_farm_generic.lua | 424 |
| `AnnounceMessages` | — | — | não | bots/mode_farm_generic.lua | 435 |

## `bots/mode_outpost_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 16 |
| `GetDesireHelper` | — | — | não | bots/mode_farm_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roam_generic.lua<br>bots/mode_roshan_generic.lua<br>bots/mode_secret_shop_generic.lua | 24 |
| `OnStart` | — | — | não | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_attack_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_roam_generic.lua | 93 |
| `OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_attack_generic.lua | 97 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 103 |
| `GetClosestOutpost` | — | — | não | — | 124 |
| `IsEnemyCloserToOutpostLoc` | opLoc, botDist | — | não | — | 144 |
| `IsSuitableToCaptureOutpost` | — | — | não | — | 167 |

## `bots/mode_push_tower_bot_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 7 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 11 |

## `bots/mode_push_tower_mid_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 7 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 11 |

## `bots/mode_push_tower_top_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 7 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 11 |

## `bots/mode_retreat_generic_wip.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 14 |
| `CountNearByUnits` | bEnemy, range | — | não | — | 231 |

## `bots/mode_roam_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 51 |
| `GetDesireHelper` | — | — | não | bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roshan_generic.lua<br>bots/mode_secret_shop_generic.lua | 59 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 141 |
| `ThinkIndividualRoaming` | — | — | não | — | 152 |
| `DoTrample` | vLoc | — | não | — | 709 |
| `TrampleToBase` | — | — | não | — | 718 |
| `ThinkGeneralRoaming` | — | — | não | — | 724 |
| `GeneralReactToStackedDebuff` | enemyHeroName | — | não | — | 899 |
| `MoveAwayFromTarget` | target, keepDistance | — | não | — | 912 |
| `ActualGankDesire` | — | — | não | — | 922 |
| `SetupTwinGates` | — | — | não | — | 938 |
| `ThinkActualGankingInLanes` | — | — | não | — | 955 |
| `OnStart` | — | — | não | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_attack_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua | 996 |
| `OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_attack_generic.lua | 999 |
| `IsInHealthyState` | — | — | não | — | 1007 |
| `CheckLaneToGank` | botPosition | — | não | — | 1011 |
| `HasSufficientMana` | nMana | — | não | — | 1103 |
| `GetGateNearLane` | laneLoc | — | não | — | 1107 |
| `TinkerWaitInBaseAndHeal` | — | — | não | — | 1122 |
| `GetMortimerKissesTarget` | — | — | não | — | 1133 |
| `ConsiderUseTango` | — | — | não | — | 1170 |
| `ConsiderWaitInBaseToHeal` | — | — | não | — | 1206 |
| `ConsiderHeroMoveOutsideFountain` | — | — | não | — | 1248 |
| `CanBeAffectedByChainFrost` | — | — | não | — | 1280 |
| `ConsiderGeneralRoamingInConditions` | — | — | não | — | 1295 |
| `GetTargetEnemy` | unitName | — | não | — | 1577 |
| `CheckHighPriorityChannelAbility` | abilityName | — | não | — | 1598 |
| `<anon>` | — | — | não | — | 1606 |
| `<anon>` | — | — | não | — | 1610 |
| `<anon>` | — | — | não | — | 1614 |
| `<anon>` | — | — | não | — | 1618 |
| `<anon>` | — | — | não | — | 1622 |
| `<anon>` | — | — | não | — | 1626 |
| `<anon>` | — | — | não | — | 1636 |
| `<anon>` | — | — | não | — | 1648 |
| `<anon>` | — | — | não | — | 1652 |
| `<anon>` | — | — | não | — | 1679 |
| `<anon>` | — | — | não | — | 1691 |
| `<anon>` | — | — | não | — | 1695 |
| `<anon>` | — | — | não | — | 1703 |
| `<anon>` | — | — | não | — | 1707 |
| `<anon>` | — | — | não | — | 1729 |
| `<anon>` | — | — | não | — | 1744 |
| `<anon>` | — | — | não | — | 1756 |
| `<anon>` | — | — | não | — | 1775 |
| `<anon>` | — | — | não | — | 1786 |
| `<anon>` | — | — | não | — | 1797 |
| `<anon>` | — | — | não | — | 1808 |
| `<anon>` | — | — | não | — | 1819 |
| `<anon>` | — | — | não | — | 1822 |
| `<anon>` | — | — | não | — | 1832 |
| `<anon>` | — | — | não | — | 1843 |
| `<anon>` | — | — | não | — | 1880 |
| `<anon>` | — | — | não | — | 1915 |
| `<anon>` | — | — | não | — | 1931 |
| `<anon>` | — | — | não | — | 1943 |
| `<anon>` | — | — | não | — | 1955 |
| `<anon>` | — | — | não | — | 1971 |
| `<anon>` | — | — | não | — | 1984 |
| `<anon>` | — | — | não | — | 1996 |

## `bots/mode_roshan_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 23 |
| `GetDesireHelper` | — | — | não | bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roam_generic.lua<br>bots/mode_secret_shop_generic.lua | 28 |

## `bots/mode_rune_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `IsHumanClaimingRune` | nRune | — | não | — | 25 |
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 59 |
| `OnStart` | — | — | não | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_attack_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua | 234 |
| `OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_attack_generic.lua | 241 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 249 |
| `X.InitRune` | — | — | não | — | 427 |
| `X.IsSuitableToPickRune` | — | — | não | — | 448 |
| `X.IsNearRune` | hUnit, nRadius | — | não | — | 466 |
| `X.GetBestRune` | — | — | não | — | 480 |
| `X.IsTheClosestAlly` | hUnit, vLocation | — | não | — | 512 |
| `X.IsThereAllyWithBottle` | vLocation, nRadius | — | não | — | 528 |
| `X.IsTherePosition` | nPos, nRuneLoc, nRadius | — | não | — | 542 |
| `X.IsPingedByHumanPlayer` | vLocation, nRadius | — | não | — | 561 |
| `X.IsPowerRune` | nRuneLoc | — | não | — | 582 |
| `X.IsMissing` | nRune | — | não | — | 597 |
| `X.IsEnemyPickRune` | nRune | — | não | — | 604 |
| `X.IsUnitAroundLocation` | vLoc, nRadius | — | não | bots/mode_farm_generic.lua | 622 |
| `X.GetScaledDesire` | nBase, nCurrDist, nMaxDist | — | não | — | 637 |
| `X.GetGoOutLocation` | — | — | não | — | 654 |
| `X.CouldBlink` | vLocation | — | não | bots/mode_farm_generic.lua | 678 |
| `X.IsTeamMustSaveRune` | nRune | — | não | — | 707 |
| `X.UpdateWisdom` | — | — | não | — | 724 |
| `X.GetCurrentWisdomTime` | — | — | não | — | 757 |
| `X.GetWisdomAlly` | vLocation | — | não | — | 765 |
| `X.GetWisdomDesire` | vLocation | — | não | — | 781 |
| `X.GetShrineOfWisdomTeam` | — | — | não | — | 804 |

## `bots/mode_secret_shop_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 17 |
| `GetDesireHelper` | — | — | não | bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roam_generic.lua<br>bots/mode_roshan_generic.lua | 25 |
| `OnStart` | — | — | não | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_attack_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua | 80 |
| `OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_attack_generic.lua | 84 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 88 |
| `X.HaveItemToSell` | — | — | não | — | 117 |
| `X.GetPreferedSecretShop` | — | — | não | — | 140 |
| `X.IsSuitableToBuy` | — | — | não | — | 155 |
| `X.IsStronger` | bot, enemy | — | não | — | 173 |

## `bots/mode_side_shop_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 23 |
| `GetDesireHelper` | — | — | não | bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roam_generic.lua<br>bots/mode_roshan_generic.lua | 31 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 291 |
| `X.IsTormentorAlive` | — | — | não | — | 366 |
| `X.IsEnoughAllies` | vLocation, nRadius | — | não | — | 388 |
| `X.GetClosestBot` | — | — | não | — | 412 |
| `X.IsTeamHealthy` | — | — | não | — | 432 |
| `X.IsGoodRighClickDamage` | — | — | não | — | 447 |
| `X.DidHumanPingedOrAtLocation` | — | — | não | — | 495 |

## `bots/mode_team_roam_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `SetStickyTarget` | t | — | não | — | 53 |
| `CapForLanePush` | desire | — | não | — | 64 |
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 72 |
| `GetDesireHelper` | — | — | não | bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roam_generic.lua<br>bots/mode_roshan_generic.lua | 83 |
| `X.GetLastHitCreep` | — | — | não | — | 328 |
| `HasModifierThatNeedToAvoidEffects` | — | — | não | — | 364 |
| `ConsiderHelpAlly` | — | — | não | — | 376 |
| `OnStart` | — | — | não | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_attack_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua | 409 |
| `OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_attack_generic.lua | 411 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 422 |
| `X.SupportFindTarget` | — | — | não | — | 478 |
| `X.CarryFindTarget` | — | — | não | — | 590 |
| `X.HasHumanAlly` | bot | — | não | — | 946 |
| `X.IsCreepTarget` | nUnit | — | não | — | 972 |
| `X.IsValid` | u | — | não | bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 1004 |
| `X.GetAttackDamageToCreep` | bot | — | não | — | 1006 |
| `X.CanNotUseAttack` | b | — | não | — | 1023 |
| `X.WillBreakInvisible` | b | — | não | bots/ability_item_usage_generic.lua | 1029 |
| `X.CanBeAttacked` | unit | — | não | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_broodmother.lua | 1040 |
| `X.GetEnemyCourier` | b, nRadius | — | não | — | 1051 |
| `X.WeakestUnitExceptRangeCanBeAttacked` | bHero, bEnemy, nRange, nRadius, bot | — | não | — | 1068 |
| `X.GetNearbyLastHitCreep` | ignorAlly, bEnemy, nDamage, nRadius, bot | — | não | — | 1099 |
| `X.GetExceptRangeLastHitCreep` | bEnemy, nDamage, nRange, nRadius, bot | — | não | — | 1161 |
| `X.IsLastHitCreep` | nCreep, nDamage | — | não | — | 1185 |
| `X.GetLastHitHealth` | bot, nCreep | — | não | — | 1204 |
| `X.IsAllysTarget` | unit | — | não | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_huskar.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_shadow_shaman.lua | 1219 |
| `X.IsEnemysTarget` | unit | — | não | — | 1237 |
| `X.CanAttackTogether` | bot | — | não | — | 1251 |
| `X.GetMostDamageUnit` | nUnits | — | não | — | 1265 |
| `X.GetCanTogetherCount` | nAllies | — | não | — | 1285 |
| `X.IsOthersTarget` | nUnit | — | não | — | 1300 |
| `X.CanBeInVisible` | bot | — | não | — | 1345 |
| `X.UpdateCommonCamp` | creep, AvailableCamp | — | não | bots/mode_farm_generic.lua | 1381 |
| `X.ConsiderHelpWhenCoreIsTargeted` | — | — | não | — | 1399 |
| `X.IsModeSuitToHitCreep` | b | — | não | — | 1427 |
| `X.IsMostAttackDamage` | b | — | não | — | 1445 |
| `X.ShouldNotRetreat` | b | — | não | — | 1457 |
| `X.ShouldAttackTowerCreep` | b | — | não | — | 1519 |
| `ItemOpsDesire` | — | — | não | — | 1594 |
| `ItemOpsThink` | — | — | não | — | 1643 |
| `GoPickUpItem` | goPickItem | — | não | — | 1664 |
| `SwapSmokeSupport` | — | — | não | — | 1676 |
| `TrySwapInvItemForClarity` | — | — | não | — | 1699 |
| `TrySwapInvItemForFlask` | — | — | não | — | 1717 |
| `TrySwapInvItemForSmoke` | — | — | não | — | 1736 |
| `TrySwapInvItemForMoonshard` | — | — | não | — | 1755 |
| `TrySwapInvItemForCheese` | — | — | não | — | 1774 |
| `TrySwapInvItemForRefresherShard` | — | — | não | — | 1795 |
| `TrySellOrDropItem` | — | — | não | — | 1815 |
| `J.FindLeastExpensiveItemSlot` | — | — | sim | — | 1842 |

## `bots/mode_ward_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 22 |
| `GetDesireHelper` | — | — | não | bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roam_generic.lua<br>bots/mode_roshan_generic.lua | 31 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 100 |
| `X.IsSuitableToWard` | — | — | não | — | 153 |
| `X.IsIBecameTheTarget` | unitList | — | não | bots/BotLib/hero_techies.lua | 173 |
| `X.IsEnemyCloserToWardLocation` | vLocation | — | não | bots/BotLib/hero_techies.lua | 186 |

## `typescript/bots/FunLib/aba_defend.ts`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetScriptDirectory` | — | string | não | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 2 |
| `getDefendState` | bot: Unit | DefendBotState | não | bots/FunLib/aba_defend.lua | 47 |
| `updateDefendGameStateCache` | — | CachedDefendGameState | não | bots/FunLib/aba_defend.lua | 115 |
| `updateDefendLocationStateCache` | — | CachedDefendLocationState | não | bots/FunLib/aba_defend.lua | 151 |
| `updateDefendUnitStateCache` | — | CachedDefendUnitState | não | bots/FunLib/aba_defend.lua | 183 |
| `_q` | v: Vector \| null \| undefined | string | não | bots/FunLib/aba_defend.lua | 212 |
| `_keyLoc` | v: Vector, r: number | string | não | bots/FunLib/aba_defend.lua | 215 |
| `_recentHeroCountNear` | loc: Vector, r: number, window | number | não | bots/FunLib/aba_defend.lua | 219 |
| `IsValidBuildingTarget` | unit: Unit \| null | unit is Unit | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/responder_policy.lua<br>typescript/bots/FunLib/responder_policy.ts | 234 |
| `IsBaseThreatActive` | — | boolean | não | bots/FunLib/aba_defend.lua | 237 |
| `WeightedEnemiesAroundLocation` | vLoc: Vector, nRadius: number | number | não | bots/FunLib/aba_defend.lua | 242 |
| `GetHumanLanePressureLane` | — | Lane | null | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/aba_push.ts | 290 |
| `GetThreatenedLane` | — | Lane | não | bots/FunLib/aba_defend.lua | 316 |
| `GetClosestAllyPos` | tPosList: number[], vLocation: Vector | number | não | bots/FunLib/aba_defend.lua | 371 |
| `GetFurthestBuildingOnLane` | lane: Lane | [Unit | any, number, number] | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/aba_push.ts | 394 |
| `GetFurthestBuildingOnLaneHelper` | lane: Lane | [Unit | any, number, number] | sim | bots/FunLib/aba_defend.lua | 407 |
| `IsThereNoTeammateTravelBootsDefender` | bot: Unit | boolean | não | bots/FunLib/aba_defend.lua | 473 |
| `GetHighGroundEdgeWaitPoint` | team: Team, lane: Lane | Vector | não | bots/FunLib/aba_defend.lua | 484 |
| `ShouldDefend` | bot: Unit, hBuilding: Unit \| null, nRadius: number | boolean | sim | bots/FunLib/aba_defend.lua<br>bots/mode_team_roam_generic.lua | 511 |
| `ConsiderPingedDefend` | bot: Unit, lane: Lane, desire: number, building: Unit \| null, tier: number, nEffAllies: number, nEnemies: number | void | não | bots/FunLib/aba_defend.lua | 625 |
| `GetDefendDesire` | bot: Unit, lane: Lane | BotModeDesire | sim | bots/FunLib/aba_defend.lua<br>bots/mode_defend_tower_bot_generic.lua<br>bots/mode_defend_tower_mid_generic.lua<br>bots/mode_defend_tower_top_generic.lua | 661 |
| `GetDefendDesireHelper` | bot: Unit, lane: Lane | BotModeDesire | sim | bots/FunLib/aba_defend.lua | 688 |
| `DefendThink` | bot: Unit, lane: Lane | void | sim | bots/FunLib/aba_defend.lua<br>bots/mode_defend_tower_bot_generic.lua<br>bots/mode_defend_tower_mid_generic.lua<br>bots/mode_defend_tower_top_generic.lua | 965 |
| `OnEnd` | — | void | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_attack_generic.lua | 1189 |

## `typescript/bots/FunLib/aba_push.ts`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `updateGameStateCache` | — | CachedGameState | não | bots/FunLib/aba_push.lua | 89 |
| `updateLocationStateCache` | — | CachedLocationState | não | bots/FunLib/aba_push.lua | 129 |
| `updateUnitStateCache` | — | CachedUnitState | não | bots/FunLib/aba_push.lua | 154 |
| `updateBotStateCache` | bot: Unit, targetLoc: Vector | CachedBotState | não | bots/FunLib/aba_push.lua | 173 |
| `GetPushDesire` | bot: Unit, lane: Lane | BotModeDesire | sim | bots/FunLib/aba_push.lua<br>bots/mode_push_tower_bot_generic.lua<br>bots/mode_push_tower_mid_generic.lua<br>bots/mode_push_tower_top_generic.lua | 230 |
| `GetHumanLanePressureLane` | — | Lane | null | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/aba_defend.ts | 258 |
| `IsEnemyThreatNearOurBase` | — | boolean | não | bots/FunLib/aba_push.lua<br>bots/FunLib/responder_policy.lua<br>typescript/bots/FunLib/responder_policy.ts | 292 |
| `GetPushDesireHelper` | bot: Unit, lane: Lane | BotModeDesire | sim | bots/FunLib/aba_push.lua | 319 |
| `presence_adjust` | score: number, loc: Vector | number | não | bots/FunLib/aba_push.lua | 707 |
| `UnitIsValidObjective` | u: Unit \| null | u is Unit | não | bots/FunLib/aba_push.lua | 713 |
| `UnitIsBarracks` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 717 |
| `UnitIsMeleeBarracks` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 721 |
| `UnitIsRangedBarracks` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 724 |
| `UnitIsT3` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 727 |
| `UnitIsT4` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 730 |
| `ObjectiveScore` | bot: Unit, u: Unit \| null, targetLoc: Vector \| null | number | não | bots/FunLib/aba_push.lua | 744 |
| `SelectOrStickHGTarget` | bot: Unit, lane: Lane, targetLoc: Vector \| null | Unit | null | não | bots/FunLib/aba_push.lua | 766 |
| `WhichLaneToPush` | _bot: Unit, _lane: Lane | Lane | sim | bots/FunLib/aba_push.lua | 821 |
| `PushThink` | bot: Unit, lane: Lane | void | sim | bots/FunLib/aba_push.lua<br>bots/mode_push_tower_bot_generic.lua<br>bots/mode_push_tower_mid_generic.lua<br>bots/mode_push_tower_top_generic.lua | 945 |
| `TryClearingOtherLaneHighGround` | _bot: Unit, vLocation: Vector | Unit | null | sim | bots/FunLib/aba_push.lua | 1119 |
| `CanBeAttacked` | building: Unit \| null | boolean | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_broodmother.lua | 1178 |
| `IsEnemyTP` | nID: number | boolean | sim | bots/FunLib/aba_push.lua | 1182 |
| `IsInDangerWithinTower` | hUnit: Unit, fThreshold: number, fDuration: number | boolean | sim | bots/FunLib/aba_push.lua | 1191 |
| `GetSpecialUnitsNearby` | bot: Unit, hUnitList: Unit[], nRadius: number | Unit[] | sim | bots/FunLib/aba_push.lua | 1203 |
| `IsHealthyInsideFountain` | hUnit: Unit | boolean | sim | bots/FunLib/aba_push.lua | 1231 |
| `GetAllyHeroesAttackingUnit` | hUnit: Unit | Unit[] | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1235 |
| `GetAllyCreepsAttackingUnit` | hUnit: Unit | Unit[] | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1246 |
| `GetLaneBuildingTier` | nLane: Lane | number | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1258 |
| `ShouldWaitForImportantItemsSpells` | vLocation: Vector | boolean | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1284 |
| `HasBackdoorProtect` | target: Unit | boolean | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1293 |
| `IsAnyTargetBackdooredAt` | _bot: Unit, lane: Lane | boolean | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1310 |
| `FindBestHGTarget` | bot: Unit, radius: number, targetLoc: Vector \| null | Unit | null | sim | bots/FunLib/aba_push.lua | 1336 |

## `typescript/bots/FunLib/global_cache.ts`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `getGlobalGameState` | — | GlobalGameState | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 69 |
| `getGlobalUnitState` | — | GlobalUnitState | sim | bots/FunLib/global_cache.lua | 112 |
| `getGlobalLocationState` | — | GlobalLocationState | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 136 |
| `getCachedData` | key: string, ttl: number, fetchFn: () => T | T | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 167 |
| `cleanupGlobalCache` | — | void | sim | bots/FunLib/global_cache.lua | 187 |
| `clearAllCaches` | — | void | sim | bots/FunLib/global_cache.lua | 201 |
| `getCachedAlliesNearLoc` | location: Vector, radius: number | Unit[] | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 213 |
| `getCachedEnemiesNearLoc` | location: Vector, radius: number | Unit[] | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 224 |
| `autoCleanupCache` | — | void | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 234 |
