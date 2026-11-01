# Code Map — OpenHyperAI

> Gerado automaticamente por `scripts/generate-code-map.js`. Não edite manualmente.

## `bots/FunLib/jmz_func.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `J.HasMovableUndyingModifier` | botTarget, nDelay | — | sim | — | 62 |
| `J.GetUnitAllyCountAroundEnemyTarget` | target, nRadius | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_shadow_demon.lua<br>bots/BotLib/hero_warlock.lua | 80 |
| `J.GetAroundTargetEnemyUnitCount` | target, nRadius | — | sim | bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_medusa.lua<br>bots/BotLib/hero_shadow_demon.lua<br>bots/BotLib/hero_shadow_shaman.lua<br>bots/BotLib/hero_sven.lua | 92 |
| `J.GetAroundTargetLocEnemyUnitCount` | targetLoc, nRadius | — | sim | — | 97 |
| `J.GetAroundTargetEnemyHeroCount` | target, nRadius | — | sim | bots/BotLib/hero_jakiro.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_sven.lua | 104 |
| `J.GetNearbyAroundLocationUnitCount` | bEnemy, bHero, nRadius, vLoc | — | sim | bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_earthshaker.lua<br>bots/BotLib/hero_lion.lua<br>bots/BotLib/hero_viper.lua | 112 |
| `J.GetAttackEnemysAllyCreepCount` | target, nRadius | — | sim | bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_shadow_shaman.lua<br>bots/BotLib/hero_skeleton_king.lua<br>bots/BotLib/hero_sven.lua | 154 |
| `J.GetVulnerableWeakestUnit` | bot, bHero, bEnemy, nRadius | — | sim | bots/BotLib/hero_nyx_assassin.lua<br>bots/BotLib/hero_obsidian_destroyer.lua<br>bots/BotLib/hero_pangolier.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_shadow_demon.lua | 173 |
| `J.GetVulnerableUnitNearLoc` | bot, bHero, bEnemy, nCastRange, nRadius, vLoc | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_grimstroke.lua<br>bots/BotLib/hero_zuus.lua<br>bots/FunLib/rubick_hero/arc_warden.lua | 185 |
| `J.GetAoeEnemyHeroLocation` | bot, nCastRange, nRadius, nCount | — | sim | bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_death_prophet.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_kez.lua | 214 |
| `J.IsWithoutTarget` | bot | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_huskar.lua<br>bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_leshrac.lua<br>bots/BotLib/hero_magnataur.lua | 247 |
| `J.GetProperTarget` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 255 |
| `J.IsAllyCanKill` | target | — | sim | — | 281 |
| `J.IsOtherAllyCanKillTarget` | bot, target | — | sim | bots/BotLib/hero_mirana.lua<br>bots/BotLib/hero_sniper.lua<br>bots/BotLib/hero_zuus.lua<br>bots/mode_farm_generic.lua<br>bots/mode_retreat_generic.lua | 320 |
| `J.GetRetreatingAlliesNearLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_winter_wyvern.lua<br>bots/FunLib/aba_defend.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 370 |
| `J.GetAlliesNearLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 394 |
| `J.GetEnemiesNearLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 417 |
| `J.GetAnyEnemiesNearLoc` | vLoc, nRadius | — | sim | — | 440 |
| `J.GetIllusionsNearLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_earthshaker.lua | 460 |
| `J.IsAllyHeroBetweenAllyAndEnemy` | hAlly, hEnemy, vLoc, nRadius | — | sim | bots/BotLib/hero_drow_ranger.lua | 483 |
| `J.IsUnderLongDurationStun` | enemyHero | — | sim | bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_winter_wyvern.lua | 521 |
| `J.GetUltimateAbility` | bot | — | sim | bots/ability_item_usage_generic.lua | 531 |
| `J.CanUseRefresherShard` | bot | — | sim | bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_invoker.lua<br>bots/ability_item_usage_generic.lua | 540 |
| `J.GetMostUltimateCDUnit` | — | — | sim | bots/mode_team_roam_generic.lua | 564 |
| `J.GetPickUltimateScepterUnit` | — | — | sim | — | 598 |
| `J.CanUseRefresherOrb` | bot | — | sim | — | 637 |
| `J.IsNoItemIllution` | bot | — | sim | bots/ability_item_usage_generic.lua | 657 |
| `J.IsNoAbilityIllution` | bot | — | sim | bots/ability_item_usage_generic.lua | 673 |
| `J.IsSuspiciousIllusion` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 691 |
| `J.CanCastAbilityOnTarget` | npcTarget, bIgnoreMagicImmune | — | sim | bots/BotLib/hero_bounty_hunter.lua<br>bots/FunLib/rubick_hero/bounty_hunter.lua | 770 |
| `J.CanCastAbility` | ability | — | sim | bots/BotLib/hero_bloodseeker.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_crystal_maiden.lua | 781 |
| `J.IsTier1` | tower | — | sim | — | 796 |
| `J.IsTier2` | tower | — | sim | — | 808 |
| `J.IsTier3p` | tower | — | sim | — | 820 |
| `J.CanBlinkDagger` | bot | — | sim | bots/BotLib/hero_mars.lua<br>bots/BotLib/hero_tinker.lua | 834 |
| `J.CanBlackKingBar` | bot | — | sim | bots/BotLib/hero_primal_beast.lua | 858 |
| `J.CanCastOnMagicImmune` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_beastmaster.lua | 881 |
| `J.IsNotImmune` | botTarget | — | sim | bots/FunLib/minion_lib/primal_split.lua | 890 |
| `J.FilterEnemiesForStun` | enemies | — | sim | bots/FunLib/minion_lib/primal_split.lua | 897 |
| `J.CanCastOnNonMagicImmune` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 908 |
| `J.IsInEtherealForm` | npcTarget | — | sim | bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_morphling.lua<br>bots/BotLib/hero_ringmaster.lua<br>bots/BotLib/hero_rubick.lua<br>bots/BotLib/hero_terrorblade.lua | 918 |
| `J.CanCastOnTargetAdvanced` | npcTarget | — | sim | bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 926 |
| `J.CanCastUnitSpellOnTarget` | npcTarget, nDelay | — | sim | — | 970 |
| `J.CanKillTarget` | npcTarget, dmg, dmgType | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 986 |
| `J.WillKillTarget` | npcTarget, dmg, dmgType, nDelay | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_dragon_knight.lua | 997 |
| `J.WillMixedDamageKillTarget` | npcTarget, nPhysicalDamge, nMagicalDamage, nPureDamage, nDelay | — | sim | bots/BotLib/hero_riki.lua | 1011 |
| `J.WillMagicKillTarget` | bot, npcTarget, dmg, nDelay | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_death_prophet.lua | 1030 |
| `J.HasForbiddenModifier` | npcTarget | — | sim | bots/BotLib/hero_legion_commander.lua<br>bots/BotLib/hero_sven.lua<br>bots/BotLib/hero_templar_assassin.lua<br>bots/ability_item_usage_generic.lua | 1078 |
| `J.GetHeroesTargetingUnit` | tUnits, hUnit | — | sim | bots/BotLib/hero_life_stealer.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_rune_generic.lua | 1128 |
| `J.GetSameUnitType` | hUnit, nRadius, sUnitName, bAttacking | — | sim | bots/mode_retreat_generic.lua | 1142 |
| `J.GetUnitListTotalAttackDamage` | bot, tUnits, fTimeInterval | — | sim | bots/mode_retreat_generic.lua | 1162 |
| `J.IsTargetedByEnemyWithModifier` | tUnits, sModifierName | — | sim | bots/mode_retreat_generic.lua | 1201 |
| `J.ShouldEscape` | bot | — | sim | bots/BotLib/hero_queenofpain.lua | 1214 |
| `J.GetClosestTeamLane` | unit | — | sim | bots/FunLib/minion_lib/illusions.lua<br>bots/FunLib/minion_lib/primal_split.lua | 1229 |
| `J.GetFirstBotInTeam` | — | — | sim | bots/mode_side_shop_generic.lua | 1252 |
| `J.GetSpecialUnits` | — | — | sim | bots/FunLib/minion_lib/illusions.lua | 1299 |
| `J.IsDisabled` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1303 |
| `J.IsTaunted` | npcTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_beastmaster.lua | 1336 |
| `J.IsInRange` | bot, npcTarget, nRadius | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1349 |
| `J.IsInLocRange` | npcTarget, nLoc, nRadius | — | sim | bots/BotLib/hero_death_prophet.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_lina.lua<br>bots/BotLib/hero_pugna.lua<br>bots/BotLib/hero_riki.lua | 1359 |
| `J.HasItemInInventory` | hItem | — | sim | bots/ability_item_usage_generic.lua | 1368 |
| `J.IsInTeamFight` | bot, nRadius | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 1372 |
| `J.GetItem` | itemName | — | sim | bots/BotLib/hero_tinker.lua<br>bots/FunLib/utils.lua<br>typescript/bots/FunLib/utils.ts | 1382 |
| `J.GetItem2` | bot, sItemName | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/responder_policy.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/jmz_func.d.ts<br>typescript/bots/FunLib/responder_policy.ts | 1397 |
| `J.IsRetreating` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1413 |
| `J.GetAbility` | bot, abilityName | — | sim | — | 1426 |
| `J.IsUnitNearby` | bot, tUnits, nRadius, sUnitName, bHero | — | sim | bots/mode_retreat_generic.lua | 1439 |
| `J.IsGoingOnSomeone` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1459 |
| `IsEnemyTerrorbladeNear` | unit, nRadius | — | não | — | 1471 |
| `GetUnitAttackDamage` | unit, fInterval, bIllusion | — | não | — | 1485 |
| `J.IsDefending` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 1523 |
| `J.IsAnyAllyDefending` | bot, lane | — | sim | typescript/bots/FunLib/jmz_func.d.ts | 1533 |
| `J.IsPushing` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 1551 |
| `J.MultipleAlliesArePushing` | — | — | sim | — | 1561 |
| `J.IsLaning` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua | 1576 |
| `J.IsDoingRoshan` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 1583 |
| `J.IsFarming` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 1592 |
| `J.IsShopping` | bot | — | sim | — | 1605 |
| `J.GetTeamFountain` | — | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_dark_seer.lua<br>bots/BotLib/hero_earthshaker.lua<br>bots/BotLib/hero_furion.lua | 1616 |
| `J.GetEnemyFountain` | — | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_kunkka.lua<br>bots/BotLib/hero_marci.lua<br>bots/BotLib/hero_muerta.lua | 1629 |
| `J.GetComboItem` | bot, sItemName | — | sim | bots/BotLib/hero_arc_warden.lua | 1643 |
| `J.HasItem` | bot, sItemName | — | sim | bots/BotLib/hero_hoodwink.lua<br>bots/BotLib/hero_lone_druid_bear.lua<br>bots/BotLib/hero_primal_beast.lua<br>bots/FunLib/aba_item.lua<br>bots/FunLib/aba_site.lua | 1655 |
| `J.FindItemSlotNotInNonbackpack` | bot, sItemName | — | sim | bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_roam_generic.lua | 1665 |
| `J.IsItemAvailable` | sItemName | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_chaos_knight.lua<br>bots/BotLib/hero_crystal_maiden.lua | 1671 |
| `J.GetMostHpUnit` | unitList | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_huskar.lua | 1685 |
| `J.GetLeastHpUnit` | unitList | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_sven.lua | 1707 |
| `J.IsAllowedToSpam` | bot, nManaCost | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bloodseeker.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_dazzle.lua | 1727 |
| `J.IsAllyUnitSpell` | sAbilityName | — | sim | bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_slark.lua | 1738 |
| `J.IsProjectileUnitSpell` | sAbilityName | — | sim | bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_slark.lua | 1745 |
| `J.IsOnlyProjectileSpell` | sAbilityName | — | sim | — | 1753 |
| `J.IsStunProjectileSpell` | sAbilityName | — | sim | — | 1760 |
| `J.IsWillBeCastUnitTargetSpell` | bot, nRadius | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_life_stealer.lua<br>bots/BotLib/hero_morphling.lua<br>bots/BotLib/hero_nyx_assassin.lua | 1767 |
| `J.IsWillBeCastPointSpell` | bot, nRadius | — | sim | bots/BotLib/hero_life_stealer.lua<br>bots/ability_item_usage_generic.lua | 1810 |
| `J.IsProjectileIncoming` | bot, range | — | sim | bots/ability_item_usage_generic.lua | 1839 |
| `J.IsUnitTargetProjectileIncoming` | bot, range | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_morphling.lua<br>bots/BotLib/hero_nyx_assassin.lua<br>bots/BotLib/hero_pangolier.lua | 1864 |
| `J.IsStunProjectileIncoming` | bot, range | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_dark_willow.lua<br>bots/BotLib/hero_ember_spirit.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_furion.lua | 1893 |
| `J.IsAttackProjectileIncoming` | bot, range | — | sim | bots/ability_item_usage_generic.lua | 1913 |
| `J.IsNotAttackProjectileIncoming` | bot, range | — | sim | bots/BotLib/hero_juggernaut.lua<br>bots/BotLib/hero_life_stealer.lua<br>bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_riki.lua<br>bots/BotLib/hero_sand_king.lua | 1931 |
| `J.GetAttackProDelayTime` | bot, nCreep | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_huskar.lua<br>bots/BotLib/hero_silencer.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_laning_generic.lua | 1954 |
| `J.GetCreepAttackActivityWillRealDamage` | nUnit, nTime | — | sim | — | 2021 |
| `J.GetCreepAttackProjectileWillRealDamage` | nUnit, nTime | — | sim | bots/mode_team_roam_generic.lua | 2082 |
| `J.GetTotalAttackWillRealDamage` | nUnit, nTime | — | sim | bots/BotLib/hero_silencer.lua | 2107 |
| `J.GetAttackProjectileDamageByRange` | nUnit, nRadius | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_leshrac.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_necrolyte.lua<br>bots/BotLib/hero_phantom_lancer.lua | 2114 |
| `J.GetCorrectLoc` | npcTarget, fDelay | — | sim | bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_earth_spirit.lua<br>bots/BotLib/hero_elder_titan.lua | 2132 |
| `J.GetDistanceFromLaneFront` | bot | — | sim | — | 2157 |
| `J.GetEscapeLoc` | — | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_dawnbreaker.lua<br>bots/BotLib/hero_earth_spirit.lua<br>bots/BotLib/hero_ember_spirit.lua<br>bots/BotLib/hero_faceless_void.lua | 2161 |
| `J.IsStuck2` | bot | — | sim | — | 2181 |
| `J.IsStuck` | bot | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_broodmother.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_earth_spirit.lua | 2200 |
| `J.IsExistInTable` | u, tUnit | — | sim | bots/BotLib/hero_medusa.lua<br>bots/FunLib/aba_item.lua | 2224 |
| `J.CombineTwoTable` | tableA, tableB | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_jakiro.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_riki.lua | 2239 |
| `J.GetInvUnitInLocCount` | bot, nRadius, nFindRadius, vLocation, pierceImmune | — | sim | bots/BotLib/hero_bloodseeker.lua<br>bots/BotLib/hero_medusa.lua<br>bots/FunLib/rubick_hero/bloodseeker.lua | 2253 |
| `J.GetInLocLaneCreepCount` | bot, nRadius, nFindRadius, vLocation | — | sim | bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_silencer.lua<br>bots/BotLib/hero_sniper.lua | 2272 |
| `J.GetInvUnitCount` | pierceImmune, unitList | — | sim | bots/BotLib/hero_zuus.lua | 2289 |
| `J.HasHealingItem` | bot | — | sim | bots/mode_roam_generic.lua | 2308 |
| `J.ShouldGoFarmDuringLaning` | bot | — | sim | bots/mode_laning_generic.lua | 2314 |
| `J.GetDistanceFromEnemyFountain` | bot | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_drow_ranger.lua<br>bots/FunLib/rubick_hero/arc_warden.lua<br>bots/mode_farm_generic.lua<br>bots/mode_retreat_generic.lua | 2328 |
| `J.GetDistanceFromAllyFountain` | bot | — | sim | bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_riki.lua | 2338 |
| `J.GetDistanceFromAncient` | bot, bEnemy | — | sim | bots/FunLib/aba_special_units.lua<br>bots/FunLib/utils.lua<br>bots/mode_laning_generic.lua<br>bots/mode_retreat_generic.lua<br>typescript/bots/FunLib/utils.ts | 2348 |
| `J.GetAroundTargetAllyHeroCount` | target, nRadius | — | sim | bots/BotLib/hero_necrolyte.lua<br>bots/ability_item_usage_generic.lua | 2359 |
| `J.GetAroundTargetOtherAllyHeroCount` | bot, target, nRadius | — | sim | bots/ability_item_usage_generic.lua | 2368 |
| `J.GetAllyCreepNearLoc` | bot, vLoc, nRadius | — | sim | — | 2382 |
| `J.GetAllyUnitCountAroundEnemyTarget` | bot, target, nRadius | — | sim | bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_silencer.lua<br>bots/FunLib/rubick_hero/crystal_maiden.lua | 2402 |
| `J.GetNearbyHeroes` | bot, nRadius, bEnemy, bBotMode | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 2436 |
| `J.GetAroundBotUnitList` | bot, nRadius, bEnemy | — | sim | bots/BotLib/hero_bounty_hunter.lua<br>bots/FunLib/rubick_hero/bounty_hunter.lua | 2486 |
| `J.GetLocationToLocationDistance` | fLoc, sLoc | — | sim | bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_centaur.lua<br>bots/BotLib/hero_elder_titan.lua<br>bots/BotLib/hero_muerta.lua | 2513 |
| `J.GetUnitTowardDistanceLocation` | bot, towardTarget, nDistance | — | sim | bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_pugna.lua<br>bots/BotLib/hero_riki.lua<br>bots/BotLib/hero_sand_king.lua | 2525 |
| `J.GetLocationTowardDistanceLocation` | bot, towardLocation, nDistance | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_pugna.lua<br>bots/BotLib/hero_riki.lua | 2535 |
| `J.GetFaceTowardDistanceLocation` | bot, nDistance | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_juggernaut.lua<br>bots/BotLib/hero_kunkka.lua<br>bots/BotLib/hero_nevermore.lua<br>bots/BotLib/hero_phantom_lancer.lua | 2545 |
| `J.SetBotPing` | vLoc | — | sim | — | 2556 |
| `J.SetBotPrint` | sMessage, vLoc, bReport, bPing | — | sim | bots/BotLib/hero_silencer.lua | 2563 |
| `J.SetReportMotive` | bDebugFile, sMotive | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_death_prophet.lua | 2585 |
| `J.GetCastLocation` | bot, npcTarget, nCastRange, nRadius | — | sim | bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_death_prophet.lua<br>bots/BotLib/hero_legion_commander.lua<br>bots/BotLib/hero_queenofpain.lua<br>bots/BotLib/hero_silencer.lua | 2603 |
| `J.GetDelayCastLocation` | bot, npcTarget, nCastRange, nRadius, nTime | — | sim | bots/BotLib/hero_bloodseeker.lua<br>bots/BotLib/hero_lina.lua<br>bots/BotLib/hero_lion.lua<br>bots/BotLib/hero_pugna.lua<br>bots/BotLib/hero_riki.lua | 2639 |
| `J.GetOne` | number | — | sim | bots/BotLib/hero_silencer.lua | 2659 |
| `J.GetTwo` | number | — | sim | — | 2666 |
| `J.SetQueueToInvisible` | bot | — | sim | bots/BotLib/hero_bane.lua<br>bots/FunLib/rubick_hero/bane.lua | 2673 |
| `J.SetQueueSwitchPtToINT` | bot | — | sim | bots/mode_farm_generic.lua | 2718 |
| `J.SetQueueUseSoulRing` | bot | — | sim | — | 2738 |
| `J.SetQueuePtToINT` | bot, bSoulRingUsed | — | sim | bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 2759 |
| `J.IsPTReady` | bot, status | — | sim | bots/mode_farm_generic.lua | 2773 |
| `J.ShouldSwitchPTStat` | bot, pt | — | sim | bots/ability_item_usage_generic.lua | 2806 |
| `J.IsOtherAllysTarget` | unit | — | sim | bots/BotLib/hero_crystal_maiden.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_largo.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_mirana.lua | 2832 |
| `J.IsAllysTarget` | unit | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_huskar.lua<br>bots/BotLib/hero_lich.lua<br>bots/BotLib/hero_phantom_lancer.lua<br>bots/BotLib/hero_shadow_shaman.lua | 2856 |
| `J.ToNearest500` | num | — | sim | — | 2876 |
| `J.ToNearest1000` | num | — | sim | — | 2881 |
| `J.IsKeyWordUnit` | keyWord, uUnit | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_bounty_hunter.lua | 2885 |
| `J.IsHumanPlayer` | nUnit | — | sim | bots/ability_item_usage_generic.lua | 2896 |
| `J.IsValid` | nTarget | — | sim | bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua | 2903 |
| `J.IsValidTarget` | nTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 2911 |
| `J.IsValidHero` | nTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 2916 |
| `J.IsValidBuilding` | nTarget | — | sim | bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_death_prophet.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_drow_ranger.lua | 2920 |
| `J.IsRoshan` | nTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_arc_warden.lua | 2924 |
| `J.IsMoving` | bot | — | sim | bots/BotLib/hero_dark_willow.lua<br>bots/BotLib/hero_kunkka.lua<br>bots/BotLib/hero_lone_druid.lua<br>bots/BotLib/hero_lone_druid_bear.lua<br>bots/BotLib/hero_muerta.lua | 2935 |
| `J.IsRunning` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_batrider.lua | 2950 |
| `J.IsAttacking` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_arc_warden.lua | 2959 |
| `J.IsChasingTarget` | bot, nTarget | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_bounty_hunter.lua | 2978 |
| `J.IsRealInvisible` | bot | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua | 2993 |
| `J.GetModifierTime` | bot, sModifierName | — | sim | bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_largo.lua | 3015 |
| `J.GetModifierCount` | bot, sModifierName | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_lion.lua<br>bots/BotLib/hero_nevermore.lua<br>bots/BotLib/hero_primal_beast.lua<br>bots/BotLib/hero_shadow_demon.lua | 3033 |
| `J.GetUniqueModifierCount` | bot, sModifierName | — | sim | bots/BotLib/hero_oracle.lua | 3051 |
| `J.GetRemainStunTime` | bot | — | sim | bots/BotLib/hero_mirana.lua | 3071 |
| `J.IsTeamActivityCount` | bot, nCount | — | sim | bots/mode_farm_generic.lua | 3089 |
| `J.GetSpecialModeAllies` | bot, nDistance, nMode | — | sim | bots/BotLib/hero_mars.lua<br>bots/BotLib/hero_phoenix.lua<br>bots/BotLib/hero_windrunner.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/mode_team_roam_generic.lua | 3109 |
| `J.GetSpecialModeAlliesCount` | nMode | — | sim | — | 3131 |
| `J.GetTeamFightLocation` | bot | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_centaur.lua<br>bots/BotLib/hero_chen.lua<br>bots/BotLib/hero_dark_willow.lua | 3140 |
| `J.GetTeamFightAlliesCount` | bot | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_silencer.lua | 3169 |
| `J.GetCenterOfUnits` | nUnits | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_beastmaster.lua | 3190 |
| `J.GetMostFarmLaneDesire` | bot | — | sim | bots/BotLib/hero_tinker.lua<br>bots/ability_item_usage_generic.lua | 3215 |
| `J.GetMostDefendLaneDesire` | — | — | sim | bots/BotLib/hero_furion.lua<br>bots/mode_farm_generic.lua<br>bots/mode_team_roam_generic.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 3240 |
| `J.GetDefendLaneDesire` | lane | — | sim | bots/FunLib/aba_defend.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/ts_libs/dota/globals.d.ts | 3264 |
| `J.IsT3TowerDown` | team, lane | — | sim | — | 3273 |
| `J.IsPingCloseToValidTower` | nTeam, ping, nRadius, fInterval | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 3283 |
| `J.IsRoshanCloseToChangingSides` | — | — | sim | bots/ability_item_usage_generic.lua<br>bots/mode_roshan_generic.lua | 3321 |
| `J.GetMostPushLaneDesire` | — | — | sim | bots/mode_team_roam_generic.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 3325 |
| `J.GetClosestAlly` | bot, nRadius | — | sim | bots/mode_team_roam_generic.lua | 3345 |
| `J.GetNearestLaneFrontLocation` | nUnitLoc, bEnemy, fDeltaFromFront | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/FunLib/rubick_hero/arc_warden.lua<br>bots/ability_item_usage_generic.lua | 3363 |
| `J.GetAttackableWeakestUnit` | bot, nRadius, bHero, bEnemy | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_chen.lua<br>bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_huskar.lua<br>bots/BotLib/hero_lich.lua | 3390 |
| `J.GetAttackableWeakestUnitFromList` | bot, unitList | — | sim | bots/mode_roam_generic.lua | 3402 |
| `J.CannotBeKilled` | bot, botTarget | — | sim | bots/BotLib/hero_dazzle.lua | 3443 |
| `J.CanIgnoreLowHp` | bot | — | sim | bots/mode_team_roam_generic.lua | 3455 |
| `J.ScoreEnemyTarget` | bot, enemy, alliesNearby | — | sim | — | 3467 |
| `J.GetBestTeamTarget` | bot, enemyHeroes, allyHeroes | — | sim | — | 3552 |
| `J.CanBeAttacked` | unit | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_broodmother.lua | 3590 |
| `J.GetHP` | unit | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua | 3612 |
| `J.GetEffectiveHP` | bot | — | sim | — | 3623 |
| `J.GetMP` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_batrider.lua | 3645 |
| `J.GetAllyList` | bot, nRadius | — | sim | bots/BotLib/hero_sven.lua<br>bots/ability_item_usage_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_team_roam_generic.lua | 3653 |
| `J.GetAllyCount` | bot, nRadius | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_razor.lua<br>bots/ability_item_usage_generic.lua<br>bots/mode_farm_generic.lua | 3675 |
| `J.GetAroundEnemyHeroList` | nRadius | — | sim | bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_bane.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_ember_spirit.lua | 3684 |
| `J.GetAroundCreepList` | nRadius, bEnemy, bNeutral, bLaneCreep | — | sim | — | 3693 |
| `J.GetAroundBuildingList` | nRadius, bEnemy, bTower, bShrine, bFiller, bBarrack, bAcient | — | sim | — | 3714 |
| `J.GetEnemyList` | bot, nRadius | — | sim | bots/BotLib/hero_chaos_knight.lua<br>bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_jakiro.lua<br>bots/BotLib/hero_kunkka.lua<br>bots/BotLib/hero_lich.lua | 3731 |
| `J.GetEnemyCount` | bot, nRadius | — | sim | bots/BotLib/hero_dazzle.lua<br>bots/BotLib/hero_medusa.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_razor.lua<br>bots/ability_item_usage_generic.lua | 3752 |
| `J.ConsiderTarget` | — | — | sim | bots/BotLib/hero_luna.lua<br>bots/BotLib/hero_medusa.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_nevermore.lua<br>bots/BotLib/hero_sniper.lua | 3760 |
| `J.IsHaveAegis` | bot | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_doom_bringer.lua<br>bots/BotLib/hero_lina.lua | 3787 |
| `J.DoesTeamHaveAegis` | — | — | sim | bots/FunLib/global_cache.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/global_cache.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 3791 |
| `J.GetCoresAverageNetworth` | — | — | sim | bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_laning_generic.lua<br>bots/mode_side_shop_generic.lua | 3813 |
| `J.GetCoresMaxNetworth` | — | — | sim | — | 3836 |
| `J.IsLocHaveTower` | nRadius, bEnemy, nLoc | — | sim | bots/ability_item_usage_generic.lua | 3859 |
| `J.GetNearbyLocationToTp` | nLoc | — | sim | bots/BotLib/hero_tinker.lua<br>bots/ability_item_usage_generic.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 3884 |
| `J.IsEnemyFacingUnit` | bot, nRadius, nDegrees | — | sim | bots/ability_item_usage_generic.lua | 3930 |
| `J.IsAllyFacingUnit` | bot, nRadius, nDegrees | — | sim | — | 3950 |
| `J.IsEnemyTargetUnit` | nUnit, nRadius | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_zuus.lua | 3971 |
| `J.IsCastingUltimateAbility` | bot | — | sim | bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_centaur.lua<br>bots/BotLib/hero_dark_willow.lua<br>bots/BotLib/hero_dawnbreaker.lua<br>bots/BotLib/hero_earth_spirit.lua | 3989 |
| `J.IsInAllyArea` | bot | — | sim | bots/mode_farm_generic.lua | 4006 |
| `J.IsInEnemyArea` | bot | — | sim | bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_sven.lua<br>bots/BotLib/hero_templar_assassin.lua<br>bots/FunLib/rubick_hero/bounty_hunter.lua | 4021 |
| `J.IsAnyAllyHeroSurroundedByManyAllies` | — | — | sim | — | 4036 |
| `J.IsAllyHeroAroundLocation` | vLoc, nRadius | — | sim | — | 4053 |
| `J.IsEnemyHeroAroundLocation` | vLoc, nRadius | — | sim | bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/ability_item_usage_generic.lua | 4071 |
| `J.GetLastSeenEnemiesNearLoc` | vLoc, nRadius | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/responder_policy.lua<br>bots/mode_farm_generic.lua<br>bots/mode_roshan_generic.lua | 4098 |
| `J.GetNumOfAliveHeroes` | bEnemy | — | sim | bots/BotLib/hero_mirana.lua<br>bots/BotLib/hero_phantom_assassin.lua<br>bots/BotLib/hero_queenofpain.lua<br>bots/BotLib/hero_riki.lua<br>bots/FunLib/global_cache.lua | 4125 |
| `J.GetNumOfHeroesNearLocation` | bEnemy, location, distance | — | sim | — | 4147 |
| `J.GetHeroesNearLocation` | bEnemy, location, distance | — | sim | bots/BotLib/hero_elder_titan.lua<br>bots/BotLib/hero_invoker.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 4159 |
| `J.GetAverageLevel` | bEnemy | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/aba_defend.ts | 4172 |
| `J.GetNumOfTeamTotalKills` | bEnemy | — | sim | bots/ability_item_usage_generic.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 4195 |
| `J.IsEarlyGame` | — | — | sim | bots/BotLib/hero_chaos_knight.lua<br>bots/BotLib/hero_morphling.lua<br>bots/FunLib/aba_ward_utility.lua<br>bots/FunLib/global_cache.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua | 4215 |
| `J.IsMidGame` | — | — | sim | bots/BotLib/hero_chaos_knight.lua<br>bots/FunLib/global_cache.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/global_cache.ts | 4222 |
| `J.IsLateGame` | — | — | sim | bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_mars.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua | 4229 |
| `J.DotProduct` | A, B | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_marci.lua<br>bots/BotLib/hero_mars.lua | 4236 |
| `J.ConsiderForMkbDisassembleMask` | bot | — | sim | bots/BotLib/hero_drow_ranger.lua<br>bots/BotLib/hero_medusa.lua<br>bots/BotLib/hero_muerta.lua<br>bots/BotLib/hero_razor.lua<br>bots/BotLib/hero_sniper.lua | 4240 |
| `J.HasNotActionLast` | nCD, nNumber | — | sim | bots/mode_farm_generic.lua | 4310 |
| `J.GetCastDelay` | bot, unit, nPointTime, nProjectSpeed | — | sim | — | 4325 |
| `J.CanBreakTeleport` | bot, unit, nPointTime, nProjectSpeed | — | sim | — | 4337 |
| `J.CanBeCast` | ability | — | sim | bots/BotLib/hero_nyx_assassin.lua | 4350 |
| `J.CanSpamSpell` | bot, manaCost | — | sim | bots/BotLib/hero_tiny.lua | 4354 |
| `J.GetProperCastRange` | bIgnore, hUnit, abilityCR | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_brewmaster.lua | 4364 |
| `J.GetLowestHPUnit` | tUnits, bIgnoreImmune | — | sim | — | 4379 |
| `J.AllowedToSpam` | bot, manaCost | — | sim | bots/BotLib/hero_ember_spirit.lua | 4394 |
| `J.CountVulnerableUnit` | tUnits, locAOE, nRadius, nUnits | — | sim | — | 4398 |
| `J.GetProperLocation` | hUnit, nDelay | — | sim | — | 4411 |
| `J.CountNotStunnedUnits` | tUnits, locAOE, nRadius, nUnits | — | sim | bots/BotLib/hero_snapfire.lua | 4418 |
| `J.CountInvUnits` | pierceImmune, units | — | sim | — | 4431 |
| `J.GetMostHPPercent` | listUnits, magicImmune | — | sim | bots/BotLib/hero_terrorblade.lua | 4443 |
| `J.HasAghanimsShard` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_earth_spirit.lua<br>bots/BotLib/hero_pugna.lua | 4459 |
| `J.GetCanBeKilledUnit` | units, nDamage, nDmgType, magicImmune | — | sim | bots/BotLib/hero_earth_spirit.lua | 4463 |
| `J.GetClosestUnit` | units | — | sim | bots/BotLib/hero_earth_spirit.lua | 4476 |
| `J.IsModeTurbo` | — | — | sim | bots/BotLib/hero_alchemist.lua<br>bots/FunLib/aba_site.lua<br>bots/FunLib/rubick_hero/alchemist.lua<br>bots/FunLib/utils.lua<br>bots/ability_item_usage_generic.lua | 4484 |
| `J.IsCore` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_chen.lua | 4500 |
| `J.IsPosxHuman` | x | — | sim | bots/mode_laning_generic.lua | 4505 |
| `J.GetCoresTotalNetworth` | — | — | sim | — | 4519 |
| `J.GetPosition` | bot | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_item.lua<br>bots/FunLib/aba_role.lua<br>bots/FunLib/aba_site.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 4527 |
| `GetEffectiveHealthFromArmor` | nHealth, fArmor | — | não | — | 4539 |
| `GetHealthMultiplier` | hUnit | — | não | — | 4544 |
| `J.WeAreStronger` | bot, nRadius | — | sim | bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_earth_spirit.lua<br>bots/BotLib/hero_ember_spirit.lua<br>bots/BotLib/hero_enchantress.lua<br>bots/BotLib/hero_grimstroke.lua | 4566 |
| `J.CanCastAbilitySoon` | ability, fTime | — | sim | — | 4671 |
| `J.GetManaThreshold` | bot, nManaCost, hAbilityList | — | sim | bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_largo.lua<br>bots/BotLib/hero_life_stealer.lua | 4691 |
| `J.CheckLoneDruid` | — | — | sim | bots/mode_farm_generic.lua | 4726 |
| `J.RandomForwardVector` | length | — | sim | bots/FunLib/aba_defend.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 4741 |
| `J.GetUnitWithMinDistanceToLoc` | hUnit, hUnits, cUnits, fMinDist, vLoc | — | sim | — | 4758 |
| `J.GetUnitWithMaxDistanceToLoc` | hUnit, hUnits, cUnits, fMinDist, vLoc | — | sim | — | 4776 |
| `J.GetFurthestUnitToLocationFrommAll` | hUnit, nRange, vLoc | — | sim | bots/BotLib/hero_tiny.lua | 4794 |
| `J.GetClosestUnitToLocationFrommAll` | hUnit, nRange, vLoc | — | sim | — | 4815 |
| `J.GetClosestUnitToLocationFrommAll2` | hUnit, nRange, vLoc | — | sim | bots/BotLib/hero_tiny.lua | 4836 |
| `J.CheckTimeOfDay` | — | — | sim | bots/BotLib/hero_lycan.lua<br>bots/BotLib/hero_night_stalker.lua<br>bots/ability_item_usage_generic.lua<br>bots/mode_roshan_generic.lua | 4857 |
| `J.GetArmorReducers` | hero | — | sim | — | 4867 |
| `J.IsRoshanAlive` | — | — | sim | bots/ability_item_usage_generic.lua<br>bots/mode_farm_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roshan_generic.lua | 4909 |
| `J.HasEnoughDPSForRoshan` | heroes | — | sim | bots/mode_roshan_generic.lua | 4924 |
| `J.IsNotSelf` | bot, ally | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_bounty_hunter.lua<br>bots/BotLib/hero_rattletrap.lua<br>bots/BotLib/hero_spectre.lua<br>bots/BotLib/hero_winter_wyvern.lua | 4954 |
| `J.IsThereNonSelfCoreNearby` | nRadius | — | sim | bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_earthshaker.lua<br>bots/BotLib/hero_grimstroke.lua<br>bots/BotLib/hero_hoodwink.lua<br>bots/BotLib/hero_kez.lua | 4963 |
| `J.GetAliveAllyCoreCount` | — | — | sim | bots/mode_side_shop_generic.lua | 4983 |
| `J.GetStrongestUnit` | nRange, hUnit, bEnemy, bMagicImune, fTime | — | sim | bots/BotLib/hero_batrider.lua<br>bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_enchantress.lua<br>bots/BotLib/hero_grimstroke.lua<br>bots/BotLib/hero_gyrocopter.lua | 4998 |
| `J.GetStrongestEnemyHero` | enemies | — | sim | bots/FunLib/minion_lib/primal_split.lua | 5020 |
| `J.GetDistance` | s, t | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_mars.lua<br>bots/BotLib/hero_rattletrap.lua<br>bots/BotLib/hero_techies.lua<br>bots/BotLib/hero_tinker.lua | 5035 |
| `J.IsHeroBetweenMeAndLocation` | hSource, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5039 |
| `J.IsEnemyBetweenMeAndLocation` | hSource, vLoc, nRadius | — | sim | bots/BotLib/hero_magnataur.lua | 5068 |
| `J.IsHeroBetweenMeAndTarget` | hSource, hTarget, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5087 |
| `J.IsCreepBetweenMeAndLocation` | hSource, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5114 |
| `J.IsUnitBetweenMeAndLocation` | hSource, hTarget, vTargetLoc, nRadius | — | sim | bots/BotLib/hero_pudge.lua<br>bots/BotLib/hero_rattletrap.lua<br>bots/BotLib/hero_ringmaster.lua | 5137 |
| `J.IsNonSiegeCreepBetweenMeAndLocation` | hSource, vLoc, nRadius | — | sim | — | 5158 |
| `J.IsThereCoreNearby` | nRadius | — | sim | bots/BotLib/hero_jakiro.lua<br>bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_morphling.lua<br>bots/BotLib/hero_pudge.lua<br>bots/BotLib/hero_venomancer.lua | 5187 |
| `J.GetClosestCore` | bot, nRadius | — | sim | bots/mode_team_roam_generic.lua | 5203 |
| `J.IsCreepBetweenMeAndTarget` | hSource, hTarget, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5222 |
| `J.IsAllyHeroBetweenMeAndTarget` | hSource, hTarget, vLoc, nRadius | — | sim | bots/FunLib/rubick_hero/rattletrap.lua | 5310 |
| `J.DidEnemyCastAbility` | — | — | sim | bots/BotLib/hero_dark_willow.lua | 5361 |
| `J.GetWeakestUnit` | nEnemyUnits | — | sim | bots/BotLib/hero_dark_willow.lua<br>bots/FunLib/minion_lib/primal_split.lua | 5399 |
| `J.HasInvisibilityOrItem` | npcEnemy | — | sim | bots/ability_item_usage_generic.lua | 5403 |
| `J.HasEnemyIceSpireNearby` | bot, nRange | — | sim | bots/mode_roam_generic.lua | 5418 |
| `J.AnyAllyAffectedByChainFrost` | bot, nRange | — | sim | bots/mode_roam_generic.lua | 5436 |
| `J.AdjustLocationWithOffset` | vLoc, offset, target | — | sim | — | 5456 |
| `J.AdjustLocationWithOffsetTowardsFountain` | loc, distance | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/global_cache.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 5468 |
| `J.IsInLaningPhase` | — | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua | 5472 |
| `J.IsTormentor` | nTarget | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_arc_warden.lua | 5487 |
| `J.IsDoingTormentor` | bot | — | sim | bots/BotLib/hero_abaddon.lua<br>bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_alchemist.lua<br>bots/BotLib/hero_ancient_apparition.lua<br>bots/BotLib/hero_antimage.lua | 5495 |
| `J.IsLocationInChrono` | loc | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_broodmother.lua<br>bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_faceless_void.lua | 5499 |
| `J.IsLocationInBlackHole` | loc | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_broodmother.lua<br>bots/BotLib/hero_disruptor.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_invoker.lua | 5525 |
| `J.IsEnemyChronosphereInLocation` | loc | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_phoenix.lua<br>bots/BotLib/hero_primal_beast.lua<br>bots/BotLib/hero_windrunner.lua<br>bots/mode_roam_generic.lua | 5541 |
| `J.IsEnemyBlackHoleInLocation` | loc | — | sim | bots/BotLib/hero_kez.lua<br>bots/BotLib/hero_phoenix.lua<br>bots/BotLib/hero_primal_beast.lua<br>bots/BotLib/hero_windrunner.lua<br>bots/mode_roam_generic.lua | 5557 |
| `J.IsLocationInArena` | loc, radius | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_mars.lua<br>bots/BotLib/hero_rattletrap.lua<br>bots/BotLib/hero_undying.lua | 5574 |
| `J.GetMeepos` | — | — | sim | bots/BotLib/hero_meepo.lua | 5601 |
| `J.IsMeepoClone` | hero | — | sim | bots/BotLib/hero_abyssal_underlord.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_keeper_of_the_light.lua<br>bots/BotLib/hero_life_stealer.lua<br>bots/BotLib/hero_marci.lua | 5617 |
| `J.DoesSomeoneHaveModifier` | nUnitList, modifierName | — | sim | bots/BotLib/hero_phoenix.lua | 5645 |
| `J.NumHumanBotPlayersInTeam` | — | — | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/aba_role.lua<br>bots/FunLib/utils.lua<br>bots/mode_farm_generic.lua<br>bots/mode_laning_generic.lua | 5659 |
| `J.GetEnemiesAroundAncient` | bot, nRadius | — | sim | bots/mode_laning_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_roshan_generic.lua<br>bots/mode_side_shop_generic.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 5674 |
| `J.DoesUnitHaveTemporaryBuff` | hUnit | — | sim | bots/mode_side_shop_generic.lua | 5678 |
| `J.GetEnemiesAroundLoc` | vLoc, nRadius | — | sim | bots/BotLib/hero_invoker.lua<br>bots/FunLib/aba_push.lua<br>bots/ability_item_usage_generic.lua<br>typescript/bots/FunLib/aba_push.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 5696 |
| `J.GetInventoryNetworth` | — | — | sim | bots/FunLib/global_cache.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/global_cache.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 5765 |
| `J.FindEnemyUnit` | name | — | sim | bots/mode_roam_generic.lua | 5814 |
| `J.GetHumanPing` | — | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/utils.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_roshan_generic.lua | 5827 |
| `J.IsStaleARDMHero` | cachedBot, cachedName | — | sim | bots/ability_item_usage_generic.lua<br>bots/item_purchase_generic.lua | 5851 |
| `J.ModeAnnounce` | bot, locKey, cooldown | — | sim | bots/mode_assemble_generic.lua<br>bots/mode_roshan_generic.lua | 5880 |
| `J.HasAbility` | bot, abilityName | — | sim | bots/BotLib/hero_brewmaster.lua<br>bots/FretBots/DataTables.lua | 5892 |
| `J.IsHumanInLoc` | vLoc, nRadius | — | sim | — | 5906 |
| `J.GetCurrentRoshanLocation` | — | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_dark_seer.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_furion.lua | 5923 |
| `J.GetTormentorLocation` | team | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_dark_seer.lua<br>bots/BotLib/hero_faceless_void.lua<br>bots/BotLib/hero_furion.lua | 5933 |
| `J.GetTormentorWaitingLocation` | team | — | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/global_cache.lua<br>bots/mode_side_shop_generic.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/global_cache.ts | 5943 |
| `J.IsClosestToDustLocation` | bot, loc | — | sim | bots/ability_item_usage_generic.lua | 5954 |
| `J.GetXUnitsTowardsLocation2` | iLoc, tLoc, nUnits | — | sim | bots/ability_item_usage_generic.lua | 5985 |
| `J.IsUnitWillGoInvisible` | unit | — | sim | bots/ability_item_usage_generic.lua | 5990 |
| `J.HasInvisCounterBuff` | unit | — | sim | bots/ability_item_usage_generic.lua | 6008 |
| `J.GetUnderlordPortal` | — | — | sim | — | 6022 |
| `J.GetTotalEstimatedDamageToTarget` | nUnits, target | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_invoker.lua<br>bots/BotLib/hero_life_stealer.lua<br>bots/BotLib/hero_mars.lua | 6052 |
| `J.GetAliveCoreCount` | nEnemy | — | sim | bots/FunLib/global_cache.lua<br>bots/mode_farm_generic.lua<br>typescript/bots/FunLib/global_cache.ts<br>typescript/bots/FunLib/jmz_func.d.ts | 6068 |
| `J.GetEnemyCountInLane` | lane | — | sim | bots/mode_roam_generic.lua | 6094 |
| `J.GetAllyCountInLane` | lane, nRadius | — | sim | — | 6120 |
| `J.GetManaAfter` | manaCost | — | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_axe.lua<br>bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_brewmaster.lua | 6137 |
| `J.GetHealthAfter` | hpCost | — | sim | bots/BotLib/hero_enigma.lua<br>bots/ability_item_usage_generic.lua | 6141 |
| `J.GetCreepListAroundTargetCanKill` | target, nRadius, damage, bEnemy, bNeutral, bLaneCreep | — | sim | bots/BotLib/hero_tinker.lua | 6146 |
| `J.GetPushTPLocation` | nLane | — | sim | bots/BotLib/hero_tinker.lua<br>bots/ability_item_usage_generic.lua | 6217 |
| `J.GetDefendTPLocation` | nLane | — | sim | bots/BotLib/hero_tinker.lua<br>bots/ability_item_usage_generic.lua | 6226 |
| `J.GetRandomLocationWithinDist` | sLoc, minDist, maxDist | — | sim | bots/BotLib/hero_techies.lua<br>bots/BotLib/hero_tinker.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/minion_lib/illusions.lua<br>typescript/bots/FunLib/aba_push.ts | 6230 |
| `J.GetHeroCountAttackingTarget` | nUnits, target | — | sim | bots/BotLib/hero_chen.lua<br>bots/FunLib/rubick_hero/chen.lua | 6238 |
| `J.GetHighestRightClickDamageHero` | nUnits | — | sim | — | 6256 |
| `J.IsBigCamp` | nUnits | — | sim | bots/BotLib/hero_clinkz.lua<br>bots/BotLib/hero_viper.lua<br>bots/FunLib/rubick_hero/clinkz.lua | 6276 |
| `J.GetETAWithAcceleration` | dist, speed, accel | — | sim | bots/BotLib/hero_techies.lua | 6294 |
| `J.GetTechiesMines` | — | — | sim | — | 6298 |
| `J.GetTechiesMinesInLoc` | loc, nRadius | — | sim | bots/BotLib/hero_techies.lua | 6313 |
| `J.CheckBitfieldFlag` | bitfield, flag | — | sim | bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_techies.lua<br>bots/FunLib/minion_lib/minion_with_skill.lua | 6329 |
| `J.GetPowerCogsCountInLoc` | loc, nRadius | — | sim | bots/FunLib/aba_special_units.lua | 6333 |
| `J.HasPowerTreads` | bot | — | sim | bots/BotLib/hero_luna.lua<br>bots/BotLib/hero_viper.lua | 6348 |
| `J.GetLanePartner` | bot | — | sim | bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/item_purchase_generic.lua | 6360 |
| `J.IsEnemyHero` | hero | — | sim | — | 6382 |
| `J.AddAvoidanceZone` | locationR, durationSec | — | sim | — | 6394 |
| `J.GetClosestAllyHero` | bot | — | sim | — | 6407 |
| `J.hasValue` | tab, val | — | sim | — | 6426 |
| `J.CheckBotIdleState` | — | — | sim | bots/mode_team_roam_generic.lua | 6441 |
| `J.AreTreesBetween` | bot, loc, r | — | sim | bots/BotLib/hero_shredder.lua | 6511 |
| `J.VectorTowards` | vStart, vTowards, nDistance | — | sim | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/ability_item_usage_generic.lua | 6548 |
| `J.VectorAway` | vStart, vTowards, nDistance | — | sim | bots/BotLib/hero_beastmaster.lua<br>bots/BotLib/hero_keeper_of_the_light.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_attack_generic.lua | 6553 |
| `J.GetAngleFromDotProduct` | dot | — | sim | — | 6558 |
| `J.IsUnitTargetedByTower` | hUnit, bTeam | — | sim | bots/BotLib/hero_dragon_knight.lua<br>bots/BotLib/hero_largo.lua | 6562 |
| `J.GetBestRetreatTree` | bot, nCastRange | — | sim | bots/BotLib/hero_shredder.lua | 6575 |
| `J.GetBestTree` | bot, enemyLoc, enemy, nCastRange, hitRadios | — | sim | bots/BotLib/hero_shredder.lua | 6605 |
| `J.GetUltLoc` | bot, target, nManaCost, nCastRange, s | — | sim | bots/BotLib/hero_shredder.lua | 6645 |

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

## `bots/mode_farm_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 57 |
| `GetDesireHelper` | — | — | não | bots/mode_outpost_generic.lua<br>bots/mode_retreat_generic.lua<br>bots/mode_roam_generic.lua<br>bots/mode_roshan_generic.lua<br>bots/mode_secret_shop_generic.lua | 66 |
| `OnStart` | — | — | não | bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_attack_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_roam_generic.lua | 529 |
| `OnEnd` | — | — | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_attack_generic.lua | 533 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 542 |
| `X.IsNearLaneFront` | bot | — | não | bots/BotLib/hero_skeleton_king.lua | 864 |
| `X.IsUnitAroundLocation` | vLoc, nRadius | — | não | bots/mode_rune_generic.lua | 878 |
| `X.CouldBlade` | bot, nLocation | — | não | — | 893 |
| `X.CouldBlink` | bot, nLocation | — | não | bots/mode_rune_generic.lua | 926 |
| `X.IsLocCanBeSeen` | vLoc | — | não | — | 997 |
| `PickOneAnnouncer` | — | — | não | bots/mode_laning_generic.lua | 1014 |
| `AnnounceMessages` | — | — | não | bots/mode_laning_generic.lua | 1026 |
| `X.ShouldRun` | bot | — | não | bots/mode_retreat_generic.lua | 1070 |
| `X.IsThereT3Detroyed` | — | — | não | — | 1331 |

## `bots/mode_laning_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 32 |
| `GetFurthestEnemyAttackRange` | enemyList | — | não | bots/FunLib/override_generic/mode_laning_generic.lua | 146 |
| `GetBestLastHitCreep` | hCreepList | — | não | bots/FunLib/override_generic/mode_laning_generic.lua | 160 |
| `GetBestDenyCreep` | hCreepList | — | não | bots/FunLib/override_generic/mode_laning_generic.lua | 180 |
| `GetBestHarassTarget` | nEnemyList, nRange | — | não | — | 193 |
| `Think` | — | — | não | bots/BotLib/hero_muerta.lua<br>bots/Buff/Timers.lua<br>bots/FretBots/Timers.lua<br>bots/FunLib/aba_minion.lua<br>bots/FunLib/aba_special_units.lua | 241 |
| `PickOneAnnouncer` | — | — | não | bots/mode_farm_generic.lua | 358 |
| `AnnounceMessages` | — | — | não | bots/mode_farm_generic.lua | 369 |

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

## `bots/mode_retreat_generic.lua`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `scanDroppedForAegis` | radius | — | não | — | 33 |
| `buildContext` | — | — | não | — | 44 |
| `GetDesire` | — | — | não | bots/--mode_item_generic.lua<br>bots/BotLib/hero_muerta.lua<br>bots/FunLib/aba_special_units.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua | 120 |
| `GetDesireHelper` | — | — | não | bots/mode_farm_generic.lua<br>bots/mode_outpost_generic.lua<br>bots/mode_roam_generic.lua<br>bots/mode_roshan_generic.lua<br>bots/mode_secret_shop_generic.lua | 129 |
| `X.LowChanceToRun` | — | — | não | — | 401 |
| `X.GetUnitDesire` | nRadius | — | não | — | 421 |
| `X.RetreatWhenTowerTargetedDesire` | — | — | não | — | 460 |
| `X.ShouldRun` | — | — | não | bots/mode_farm_generic.lua | 491 |
| `X.ConsiderCompleteItem` | — | — | não | — | 737 |

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
| `getDefendState` | bot: Unit | DefendBotState | não | bots/FunLib/aba_defend.lua | 48 |
| `_q` | v: Vector \| null \| undefined | string | não | bots/FunLib/aba_defend.lua | 73 |
| `_keyLoc` | v: Vector, r: number | string | não | bots/FunLib/aba_defend.lua | 76 |
| `_recentHeroCountNear` | loc: Vector, r: number, window | number | não | bots/FunLib/aba_defend.lua | 80 |
| `IsValidBuildingTarget` | unit: Unit \| null | unit is Unit | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/responder_policy.lua<br>typescript/bots/FunLib/responder_policy.ts | 95 |
| `IsBaseThreatActive` | — | boolean | não | bots/FunLib/aba_defend.lua | 98 |
| `WeightedEnemiesAroundLocation` | vLoc: Vector, nRadius: number | number | não | bots/FunLib/aba_defend.lua | 103 |
| `GetHumanLanePressureLane` | — | Lane | null | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/aba_push.ts | 151 |
| `GetThreatenedLane` | — | Lane | não | bots/FunLib/aba_defend.lua | 177 |
| `GetClosestAllyPos` | tPosList: number[], vLocation: Vector | number | não | bots/FunLib/aba_defend.lua | 232 |
| `GetFurthestBuildingOnLane` | lane: Lane | [Unit | any, number, number] | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/aba_push.ts | 255 |
| `GetFurthestBuildingOnLaneHelper` | lane: Lane | [Unit | any, number, number] | sim | bots/FunLib/aba_defend.lua | 268 |
| `IsThereNoTeammateTravelBootsDefender` | bot: Unit | boolean | não | bots/FunLib/aba_defend.lua | 334 |
| `ShouldDefend` | bot: Unit, hBuilding: Unit \| null, nRadius: number | boolean | sim | bots/FunLib/aba_defend.lua<br>bots/mode_team_roam_generic.lua | 345 |
| `ConsiderPingedDefend` | bot: Unit, lane: Lane, desire: number, building: Unit \| null, tier: number, nEffAllies: number, nEnemies: number | void | não | bots/FunLib/aba_defend.lua | 459 |
| `GetDefendDesire` | bot: Unit, lane: Lane | BotModeDesire | sim | bots/FunLib/aba_defend.lua<br>bots/mode_defend_tower_bot_generic.lua<br>bots/mode_defend_tower_mid_generic.lua<br>bots/mode_defend_tower_top_generic.lua | 495 |
| `GetDefendDesireHelper` | bot: Unit, lane: Lane | BotModeDesire | sim | bots/FunLib/aba_defend.lua | 522 |
| `DefendThink` | bot: Unit, lane: Lane | void | sim | bots/FunLib/aba_defend.lua<br>bots/mode_defend_tower_bot_generic.lua<br>bots/mode_defend_tower_mid_generic.lua<br>bots/mode_defend_tower_top_generic.lua | 799 |
| `OnEnd` | — | void | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/override_generic/mode_attack_generic.lua<br>bots/FunLib/override_generic/mode_laning_generic.lua<br>bots/mode_assemble_generic.lua<br>bots/mode_attack_generic.lua | 1023 |

## `typescript/bots/FunLib/aba_push.ts`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `updateBotStateCache` | bot: Unit, targetLoc: Vector | CachedBotState | não | bots/FunLib/aba_push.lua | 44 |
| `GetPushDesire` | bot: Unit, lane: Lane | BotModeDesire | sim | bots/FunLib/aba_push.lua<br>bots/mode_push_tower_bot_generic.lua<br>bots/mode_push_tower_mid_generic.lua<br>bots/mode_push_tower_top_generic.lua | 101 |
| `GetHumanLanePressureLane` | — | Lane | null | não | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/aba_defend.ts | 129 |
| `IsEnemyThreatNearOurBase` | — | boolean | não | bots/FunLib/aba_push.lua<br>bots/FunLib/responder_policy.lua<br>typescript/bots/FunLib/responder_policy.ts | 163 |
| `GetPushDesireHelper` | bot: Unit, lane: Lane | BotModeDesire | sim | bots/FunLib/aba_push.lua | 190 |
| `presence_adjust` | score: number, loc: Vector | number | não | bots/FunLib/aba_push.lua | 578 |
| `UnitIsValidObjective` | u: Unit \| null | u is Unit | não | bots/FunLib/aba_push.lua | 584 |
| `UnitIsBarracks` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 588 |
| `UnitIsMeleeBarracks` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 592 |
| `UnitIsRangedBarracks` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 595 |
| `UnitIsT3` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 598 |
| `UnitIsT4` | u: Unit | boolean | não | bots/FunLib/aba_push.lua | 601 |
| `ObjectiveScore` | bot: Unit, u: Unit \| null, targetLoc: Vector \| null | number | não | bots/FunLib/aba_push.lua | 615 |
| `SelectOrStickHGTarget` | bot: Unit, lane: Lane, targetLoc: Vector \| null | Unit | null | não | bots/FunLib/aba_push.lua | 637 |
| `WhichLaneToPush` | _bot: Unit, _lane: Lane | Lane | sim | bots/FunLib/aba_push.lua | 692 |
| `PushThink` | bot: Unit, lane: Lane | void | sim | bots/FunLib/aba_push.lua<br>bots/mode_push_tower_bot_generic.lua<br>bots/mode_push_tower_mid_generic.lua<br>bots/mode_push_tower_top_generic.lua | 816 |
| `TryClearingOtherLaneHighGround` | _bot: Unit, vLocation: Vector | Unit | null | sim | bots/FunLib/aba_push.lua | 990 |
| `CanBeAttacked` | building: Unit \| null | boolean | sim | bots/BotLib/hero_antimage.lua<br>bots/BotLib/hero_arc_warden.lua<br>bots/BotLib/hero_brewmaster.lua<br>bots/BotLib/hero_bristleback.lua<br>bots/BotLib/hero_broodmother.lua | 1049 |
| `IsEnemyTP` | nID: number | boolean | sim | bots/FunLib/aba_push.lua | 1053 |
| `IsInDangerWithinTower` | hUnit: Unit, fThreshold: number, fDuration: number | boolean | sim | bots/FunLib/aba_push.lua | 1062 |
| `GetSpecialUnitsNearby` | bot: Unit, hUnitList: Unit[], nRadius: number | Unit[] | sim | bots/FunLib/aba_push.lua | 1074 |
| `IsHealthyInsideFountain` | hUnit: Unit | boolean | sim | bots/FunLib/aba_push.lua | 1102 |
| `GetAllyHeroesAttackingUnit` | hUnit: Unit | Unit[] | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1106 |
| `GetAllyCreepsAttackingUnit` | hUnit: Unit | Unit[] | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1117 |
| `GetLaneBuildingTier` | nLane: Lane | number | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1129 |
| `ShouldWaitForImportantItemsSpells` | vLocation: Vector | boolean | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1155 |
| `HasBackdoorProtect` | target: Unit | boolean | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1164 |
| `IsAnyTargetBackdooredAt` | _bot: Unit, lane: Lane | boolean | sim | bots/FunLib/aba_push.lua<br>typescript/bots/FunLib/jmz_func.d.ts | 1181 |
| `FindBestHGTarget` | bot: Unit, radius: number, targetLoc: Vector \| null | Unit | null | sim | bots/FunLib/aba_push.lua | 1207 |

## `typescript/bots/FunLib/global_cache.ts`

| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |
|---|---|---|---|---|---|
| `getGlobalGameState` | — | GlobalGameState | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/aba_push.ts | 73 |
| `getGlobalUnitState` | — | GlobalUnitState | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/aba_push.ts | 118 |
| `GetHighGroundEdgeWaitPoint` | team: Team, lane: Lane | Vector | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_defend.ts | 147 |
| `getGlobalLocationState` | — | GlobalLocationState | sim | bots/FunLib/aba_defend.lua<br>bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_defend.ts<br>typescript/bots/FunLib/aba_push.ts | 169 |
| `getCachedData` | key: string, ttl: number, fetchFn: () => T | T | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 208 |
| `cleanupGlobalCache` | — | void | sim | bots/FunLib/global_cache.lua | 228 |
| `clearAllCaches` | — | void | sim | bots/FunLib/global_cache.lua | 242 |
| `getCachedAlliesNearLoc` | location: Vector, radius: number | Unit[] | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 254 |
| `getCachedEnemiesNearLoc` | location: Vector, radius: number | Unit[] | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 264 |
| `autoCleanupCache` | — | void | sim | bots/FunLib/aba_push.lua<br>bots/FunLib/global_cache.lua<br>typescript/bots/FunLib/aba_push.ts | 273 |
