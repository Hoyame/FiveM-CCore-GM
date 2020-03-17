local pedList = { "mp_m_freemode_01", "mp_f_freemode_01", "csb_agent", "ig_amandatownley", "s_m_m_strpreach_01", "a_m_m_fatlatin_01", "a_f_m_beach_01", "a_f_m_bevhills_01", "a_f_m_bevhills_02", "a_f_m_bodybuild_01", "a_f_m_business_02", "a_f_m_downtown_01", "a_f_m_eastsa_01", "a_f_m_eastsa_02", "a_f_m_fatbla_01", "a_f_m_fatcult_01", "a_f_m_fatwhite_01", "a_f_m_ktown_01", "a_f_m_ktown_02", "a_f_m_prolhost_01", "a_f_m_salton_01", "a_f_m_skidrow_01", "a_f_m_soucent_01", "a_f_m_soucent_02", "a_f_m_soucentmc_01", "a_f_m_tourist_01", "a_f_m_tramp_01", "a_f_m_trampbeac_01", "a_f_o_genstreet_01", "a_f_o_indian_01", "a_f_o_ktown_01", "a_f_o_salton_01", "a_f_o_soucent_01", "a_f_o_soucent_02", "a_f_y_beach_01", "a_f_y_bevhills_01", "a_f_y_bevhills_02", "a_f_y_bevhills_03", "a_f_y_bevhills_04", "a_f_y_business_01", "a_f_y_business_02", "a_f_y_business_03", "a_f_y_business_04", "a_f_y_eastsa_01", "a_f_y_eastsa_02", "a_f_y_eastsa_03", "a_f_y_epsilon_01", "a_f_y_fitness_01", "a_f_y_fitness_02", "a_f_y_genhot_01", "a_f_y_golfer_01", "a_f_y_hiker_01", "a_f_y_hippie_01", "a_f_y_hipster_01", "a_f_y_hipster_02", "a_f_y_hipster_03", "a_f_y_hipster_04", "a_f_y_indian_01", "a_f_y_juggalo_01", "a_f_y_runner_01", "a_f_y_rurmeth_01", "a_f_y_scdressy_01", "a_f_y_skater_01", "a_f_y_soucent_01", "a_f_y_soucent_02", "a_f_y_soucent_03", "a_f_y_tennis_01", "a_f_y_topless_01", "a_f_y_tourist_01", "a_f_y_tourist_02", "a_f_y_vinewood_01", "a_f_y_vinewood_02", "a_f_y_vinewood_03", "a_f_y_vinewood_04", "a_f_y_yoga_01", "a_m_m_acult_01", "a_m_m_afriamer_01", "a_m_m_beach_01", "a_m_m_beach_02", "a_m_m_bevhills_01", "a_m_m_bevhills_02", "a_m_m_business_01", "a_m_m_eastsa_01", "a_m_m_eastsa_02", "a_m_m_farmer_01", "a_m_m_fatlatin_01", "a_m_m_genfat_01", "a_m_m_genfat_02", "a_m_m_golfer_01", "a_m_m_hasjew_01", "a_m_m_hillbilly_01", "a_m_m_hillbilly_02", "a_m_m_indian_01", "a_m_m_ktown_01", "a_m_m_malibu_01", "a_m_m_mexcntry_01", "a_m_m_mexlabor_01", "a_m_m_og_boss_01", "a_m_m_paparazzi_01", "a_m_m_polynesian_01", "a_m_m_prolhost_01", "a_m_m_rurmeth_01", "a_m_m_salton_01", "a_m_m_salton_02", "a_m_m_salton_03", "a_m_m_salton_04", "a_m_m_skater_01", "a_m_m_skidrow_01", "a_m_m_socenlat_01", "a_m_m_soucent_01", "a_m_m_soucent_02", "a_m_m_soucent_03", "a_m_m_soucent_04", "a_m_m_stlat_02", "a_m_m_tennis_01", "a_m_m_tourist_01", "a_m_m_tramp_01", "a_m_m_trampbeac_01", "a_m_m_tranvest_01", "a_m_m_tranvest_02", "a_m_o_acult_01", "a_m_o_acult_02", "a_m_o_beach_01", "a_m_o_genstreet_01", "a_m_o_ktown_01", "a_m_o_salton_01", "a_m_o_soucent_01", "a_m_o_soucent_02", "a_m_o_soucent_03", "a_m_o_tramp_01", "a_m_y_acult_01", "a_m_y_acult_02", "a_m_y_beach_01", "a_m_y_beach_02", "a_m_y_beach_03", "a_m_y_beachvesp_01", "a_m_y_beachvesp_02", "a_m_y_bevhills_01", "a_m_y_bevhills_02", "a_m_y_breakdance_01", "a_m_y_busicas_01", "a_m_y_business_01", "a_m_y_business_02", "a_m_y_business_03", "a_m_y_cyclist_01", "a_m_y_dhill_01", "a_m_y_downtown_01", "a_m_y_eastsa_01", "a_m_y_eastsa_02", "a_m_y_epsilon_01", "a_m_y_epsilon_02", "a_m_y_gay_01", "a_m_y_gay_02", "a_m_y_genstreet_01", "a_m_y_genstreet_02", "a_m_y_golfer_01", "a_m_y_hasjew_01", "a_m_y_hiker_01", "a_m_y_hippy_01", "a_m_y_hipster_01", "a_m_y_hipster_02", "a_m_y_hipster_03", "a_m_y_indian_01", "a_m_y_jetski_01", "a_m_y_juggalo_01", "a_m_y_ktown_01", "a_m_y_ktown_02", "a_m_y_latino_01", "a_m_y_methhead_01", "a_m_y_mexthug_01", "a_m_y_motox_01", "a_m_y_motox_02", "a_m_y_musclbeac_01", "a_m_y_musclbeac_02", "a_m_y_polynesian_01", "a_m_y_roadcyc_01", "a_m_y_runner_01", "a_m_y_runner_02", "a_m_y_salton_01", "a_m_y_skater_01", "a_m_y_skater_02", "a_m_y_soucent_01", "a_m_y_soucent_02", "a_m_y_soucent_03", "a_m_y_soucent_04", "a_m_y_stbla_01", "a_m_y_stbla_02", "a_m_y_stlat_01", "a_m_y_stwhi_01", "a_m_y_stwhi_02", "a_m_y_sunbathe_01", "a_m_y_surfer_01", "a_m_y_vindouche_01", "a_m_y_vinewood_01", "a_m_y_vinewood_02", "a_m_y_vinewood_03", "a_m_y_vinewood_04", "a_m_y_yoga_01", "g_f_importexport_01", "g_f_y_ballas_01", "g_f_y_families_01", "g_f_y_lost_01", "g_f_y_vagos_01", "g_m_importexport_01", "g_m_m_armboss_01", "g_m_m_armgoon_01", "g_m_m_armlieut_01", "g_m_m_chemwork_01", "g_m_m_chiboss_01", "g_m_m_chicold_01", "g_m_m_chigoon_01", "g_m_m_chigoon_02", "g_m_m_korboss_01", "g_m_m_mexboss_01", "g_m_m_mexboss_02", "g_m_y_armgoon_02", "g_m_y_azteca_01", "g_m_y_ballaeast_01", "g_m_y_ballaorig_01", "g_m_y_ballasout_01", "g_m_y_famca_01", "g_m_y_famdnf_01", "g_m_y_famfor_01", "g_m_y_korean_01", "g_m_y_korean_02", "g_m_y_korlieut_01", "g_m_y_lost_01", "g_m_y_lost_02", "g_m_y_lost_03", "g_m_y_mexgang_01", "g_m_y_mexgoon_01", "g_m_y_mexgoon_02", "g_m_y_mexgoon_03", "g_m_y_pologoon_01", "g_m_y_pologoon_02", "g_m_y_salvaboss_01", "g_m_y_salvagoon_01", "g_m_y_salvagoon_02", "g_m_y_salvagoon_03", "g_m_y_strpunk_01", "g_m_y_strpunk_02", "ig_abigail", "ig_amandatownley", "ig_andreas", "ig_ashley", "ig_ballasog", "ig_bankman", "ig_barry", "ig_benny", "ig_bestmen", "ig_beverly", "ig_brad", "ig_bride", "ig_car3guy1", "ig_car3guy2", "ig_chef", "ig_chengsr", "ig_chrisformage", "ig_clay", "ig_claypain", "ig_cletus", "ig_dale", "ig_davenorton", "ig_denise", "ig_devin", "ig_dom", "ig_dreyfuss", "ig_drfriedlander", "ig_fabien", "ig_fbisuit_01", "ig_floyd", "ig_g", "ig_groom", "ig_hao", "ig_hunter", "ig_janet", "ig_jay_norris", "ig_jewelass", "ig_jimmyboston", "ig_jimmydisanto", "ig_joeminuteman", "ig_josef", "ig_josh", "ig_kerrymcintosh", "ig_lamardavis", "ig_lazlow", "ig_lestercrest", "ig_lifeinvad_01", "ig_lifeinvad_02", "ig_magenta", "ig_malc", "ig_manuel", "ig_marnie", "ig_maryann", "ig_maude", "ig_michelle", "ig_milton", "ig_molly", "ig_mrk", "ig_mrs_thornhill", "ig_mrsphillips", "ig_natalia", "ig_nervousron", "ig_nigel", "ig_old_man1a", "ig_old_man2", "ig_omega", "ig_oneil", "ig_ortega", "ig_paper", "ig_patricia", "ig_priest", "ig_ramp_gang", "ig_ramp_hic", "ig_ramp_hipster", "ig_ramp_mex", "ig_roccopelosi", "ig_russiandrunk", "ig_screen_writer", "ig_solomon", "ig_stevehains", "ig_stretch", "ig_talina", "ig_tanisha", "ig_taocheng", "ig_taostranslator", "ig_tenniscoach", "ig_terry", "ig_tomepsilon", "ig_tonya", "ig_tracydisanto", "ig_trafficwarden", "ig_tylerdix", "ig_vagspeak", "ig_wade", "ig_zimbor", "mp_f_boatstaff_01", "mp_f_cardesign_01", "mp_f_chbar_01", "mp_f_counterfeit_01", "mp_f_execpa_01", "mp_f_forgery_01", "mp_f_weed_01", "mp_g_m_pros_01", "mp_m_counterfeit_01", "mp_m_exarmy_01", "mp_m_execpa_01", "mp_m_famdd_01", "mp_m_forgery_01", "mp_m_g_vagfun_01", "mp_m_shopkeep_01", "mp_m_waremech_01", "mp_m_weed_01", "s_f_m_fembarber", "s_f_m_maid_01", "s_f_m_shop_high", "s_f_m_sweatshop_01", "s_f_y_bartender_01", "s_f_y_hooker_01", "s_f_y_hooker_02", "s_f_y_hooker_03", "s_f_y_migrant_01", "s_f_y_movprem_01", "s_f_y_shop_low", "s_f_y_shop_mid", "s_f_y_sweatshop_01", "s_m_m_ammucountry", "s_m_m_autoshop_01", "s_m_m_autoshop_02", "s_m_m_bouncer_01", "s_m_m_ciasec_01", "s_m_m_cntrybar_01", "s_m_m_fiboffice_01", "s_m_m_fiboffice_02", "s_m_m_gaffer_01", "s_m_m_gardener_01", "s_m_m_hairdress_01", "s_m_m_highsec_01", "s_m_m_highsec_02", "s_m_m_janitor", "s_m_m_lathandy_01", "s_m_m_lifeinvad_01", "s_m_m_linecook", "s_m_m_lsmetro_01", "s_m_m_mariachi_01", "s_m_m_migrant_01", "s_m_m_movprem_01", "s_m_m_strpreach_01", "s_m_m_strvend_01", "s_m_m_trucker_01", "s_m_o_busker_01", "s_m_y_ammucity_01", "s_m_y_barman_01", "s_m_y_busboy_01", "s_m_y_chef_01", "s_m_y_dealer_01", "s_m_y_devinsec_01", "s_m_y_grip_01", "s_m_y_robber_01", "s_m_y_shop_mask", "s_m_y_strvend_01", "s_m_y_valet_01", "s_m_y_waiter_01", "s_m_y_winclean_01", "s_m_y_xmech_01", "s_m_y_xmech_02", "s_m_y_xmech_02_mp", "u_f_m_miranda", "u_f_m_promourn_01", "u_f_o_moviestar", "u_f_o_prolhost_01", "u_f_y_bikerchic", "u_f_y_comjane", "u_f_y_hotposh_01", "u_f_y_jewelass_01", "u_f_y_mistress", "u_f_y_poppymich", "u_f_y_princess", "u_f_y_spyactress", "u_m_m_aldinapoli", "u_m_m_bankman", "u_m_m_bikehire_01", "u_m_m_fibarchitect", "u_m_m_filmdirector", "u_m_m_glenstank_01", "u_m_m_griff_01", "u_m_m_jesus_01", "u_m_m_jewelsec_01", "u_m_m_jewelthief", "u_m_m_markfost", "u_m_m_partytarget", "u_m_m_promourn_01", "u_m_m_rivalpap", "u_m_m_spyactor", "u_m_m_willyfist", "u_m_o_finguru_01", "u_m_o_taphillbilly", "u_m_o_tramp_01", "u_m_y_abner", "u_m_y_antonb", "u_m_y_babyd", "u_m_y_baygor", "u_m_y_chip", "u_m_y_cyclist_01", "u_m_y_fibmugger_01", "u_m_y_guido_01", "u_m_y_gunvend_01", "u_m_y_hippie_01", "u_m_y_mani", "u_m_y_militarybum", "u_m_y_paparazzi", "u_m_y_party_01", "u_m_y_sbike", "u_m_y_tattoo_01", "s_m_y_cop_01", "s_m_y_blackops_01", "s_m_y_blackops_02", "s_m_y_blackops_03", "a_f_y_femaleagent", "mp_f_cocaine_01", "mp_f_execpa_02", "mp_f_helistaff_01", "mp_f_meth_01", "mp_f_weed_01", "mp_m_cocaine_01", "mp_m_counterfeit_01", "mp_m_meth_01", "mp_m_securoguard_01", "mp_m_weapexp_01", "mp_m_weapwork_01", "u_m_m_streetart_01", "ig_lestercrest_2", "ig_avon", "mp_m_avongoon", "mp_m_bogdangoon", "csb_jackhowitzer", "cs_amandatownley","cs_andreas","cs_ashley","cs_bankman","cs_barry","cs_beverly","cs_brad","cs_bradcadaver","cs_carbuyer","cs_casey","cs_chengsr","cs_chrisformage","cs_clay","cs_dale","cs_davenorton","cs_debra","cs_denise","cs_devin","cs_dom","cs_dreyfuss","cs_drfriedlander","cs_fabien","cs_fbisuit_01","cs_floyd","cs_guadalope","cs_gurk","cs_hunter","cs_janet","cs_jewelass","cs_jimmyboston","cs_jimmydisanto","cs_joeminuteman","cs_johnnyklebitz","cs_josef","cs_josh","cs_lamardavis","cs_lazlow","cs_lestercrest","cs_lifeinvad_01","cs_magenta","cs_manuel","cs_marnie","cs_martinmadrazo","cs_maryann","cs_michelle","cs_milton","cs_molly","cs_movpremf_01","cs_movpremmale","cs_mrk","cs_mrs_thornhill","cs_mrsphillips","cs_natalia","cs_nervousron","cs_nigel","cs_old_man1a","cs_old_man2","cs_omega","cs_orleans","cs_paper","cs_patricia","cs_priest","cs_prolsec_02","cs_russiandrunk","cs_siemonyetarian","cs_solomon","cs_stevehains","cs_stretch","cs_tanisha","cs_taocheng","cs_taostranslator","cs_tenniscoach","cs_terry","cs_tom","cs_tomepsilon","cs_tracydisanto","cs_wade","cs_zimbor","csb_abigail","csb_anita","csb_anton","csb_ballasog","csb_bride","csb_burgerdrug","csb_car3guy1","csb_car3guy2","csb_chef","csb_chin_goon","csb_cletus","csb_cop","csb_customer","csb_denise_friend","csb_fos_rep","csb_g","csb_groom","csb_grove_str_dlr","csb_hao","csb_hugh","csb_imran","csb_janitor","csb_maude","csb_mweather","csb_ortega","csb_oscar","csb_porndudes","csb_prologuedriver","csb_prolsec","csb_ramp_gang","csb_ramp_hic","csb_ramp_hipster","csb_ramp_marine","csb_ramp_mex","csb_reporter","csb_roccopelosi","csb_screen_writer","csb_stripper_01","csb_stripper_02","csb_tonya","csb_trafficwarden","csb_vagspeak","hc_driver","hc_gunman","hc_hacker","ig_casey","ig_johnnyklebitz","ig_orleans","ig_prolsec_02","ig_siemonyetarian","mp_f_deadhooker","mp_f_misty_01","mp_f_stripperlite","mp_f_stripperlite","mp_m_fibsec_01","mp_s_m_armoured_01","s_f_y_airhostess_01","s_f_y_baywatch_01","s_f_y_cop_01","s_f_y_factory_01","s_f_y_ranger_01","s_f_y_scrubs_01","s_f_y_sheriff_01","s_f_y_stripper_01","s_f_y_stripper_02","s_f_y_stripperlite","s_m_m_armoured_01","s_m_m_armoured_02","s_m_m_chemsec_01","s_m_m_dockwork_01","s_m_m_doctor_01","s_m_m_gentransport","s_m_m_marine_01","s_m_m_marine_02","s_m_m_movalien_01","s_m_m_movspace_01","s_m_m_paramedic_01","s_m_m_pilot_01","s_m_m_pilot_02","s_m_m_postal_01","s_m_m_postal_02","s_m_m_prisguard_01","s_m_m_scientist_01","s_m_m_security_01","s_m_m_snowcop_01","s_m_m_strperf_01","s_m_m_ups_01","s_m_m_ups_02","s_m_y_airworker","s_m_y_armymech_01","s_m_y_autopsy_01","s_m_y_baywatch_01","s_m_y_clown_01","s_m_y_construct_01","s_m_y_construct_02","s_m_y_dockwork_01","s_m_y_doorman_01","s_m_y_dwservice_01","s_m_y_dwservice_02","s_m_y_factory_01","s_m_y_fireman_01","s_m_y_garbage","s_m_y_hwaycop_01","s_m_y_marine_01","s_m_y_marine_02","s_m_y_marine_03","s_m_y_mime","s_m_y_pestcont_01","s_m_y_pilot_01","s_m_y_prismuscl_01","s_m_y_prisoner_01","s_m_y_ranger_01","s_m_y_sheriff_01","s_m_y_uscg_01","u_m_m_prolsec_01","u_m_y_burgerdrug_01","u_m_y_imporage","u_m_y_justin","u_m_y_prisoner_01","u_m_y_proldriver_01","u_m_y_rsranger_01","u_m_y_staggrm_01", "a_f_y_clubcust_01", "a_f_y_clubcust_02", "a_f_y_clubcust_03", "ig_agent", "ig_mp_agent14", "ig_chef2", "ig_popov", "ig_karen_daniels", "ig_rashcosvki", "ig_money", "ig_paige", "ig_djblamadon", "ig_djblamryans", "ig_djblamrupert", "ig_djdixmanager", "ig_djsolfotios", "ig_djsoljakob", "ig_djsolmike", "ig_djsolrobt", "ig_djtalaurelia", "ig_djtalignazio", "ig_dix", "ig_englishdave", "ig_djgeneric_01", "ig_jimmyboston_02", "ig_kerrymcintosh_02", "ig_lacey_jones_02", "ig_lazlow_2", "ig_sol", "ig_djsolmanager", "ig_talcc", "ig_talmm", "ig_tylerdix_02", "ig_tonyprince", "ig_sacha", "u_m_y_juggernaut_01", "u_m_y_corpse_01", "u_m_m_doa_01", "u_m_m_edtoh", "u_m_y_smugmech_01", "u_m_o_filmnoir", "u_m_y_pogo_01", "u_m_y_zombie_01", "u_m_y_danceburl_01", "u_m_y_dancelthr_01", "u_m_y_dancerave_01", "mp_f_meth_01", "mp_m_boatstaff_01", "mp_m_claude_01", "mp_m_marston_01", "mp_m_niko_01", "mp_f_bennymech_01", "csb_mp_agent14", "csb_avon", "csb_bogdan", "csb_chef2", "csb_popov", "cs_karen_daniels", "csb_rashcosvki", "csb_money", "csb_mrs_r", "csb_paige", "csb_undercover", "csb_djblamadon", "csb_dix", "csb_englishdave", "cs_lazlow_2", "csb_sol", "csb_talcc", "csb_talmm", "csb_tonyprince", "csb_alan", "csb_bryony", "s_m_m_ccrew_01", "s_m_m_fibsec_01", "s_m_y_swat_01", "s_m_y_clubbar_01", "s_m_y_waretech_01", "s_f_y_clubbar_01", "u_f_m_corpse_01", "u_f_y_corpse_01", "u_f_y_corpse_02", "u_f_m_miranda_02", "u_f_y_poppymich_02", "u_f_y_danceburl_01", "u_f_y_dancelthr_01", "u_f_y_dancerave_01", "a_m_y_clubcust_01", "a_m_y_clubcust_02", "a_m_y_clubcust_03" }
local sexeSelect = 0
local teteSelect = 0
local colorPeauSelect = 0
local cheveuxSelect = 0
local bebarSelect = -1
local poilsCouleurSelect = 0
local ImperfectionsPeau = 0
local face, acne, skin, eyecolor, skinproblem, freckle, wrinkle, hair, haircolor, eyebrow, beard, beardcolor

CMenu = {}
CMenu.Data = {}

function GetMPModel(sex)
	return GetHashKey(pedList[sex + 1])
end

local function SetMPModel(model, CMenu)
	local ped = GetPlayerPed(-1)

	if not IsModelValid(model) or not IsModelInCdimage(model) then return end

	if not HasModelLoaded(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do Citizen.Wait(100) end
	end

	SetPlayerModel(PlayerId(), model)
	SetPedDefaultComponentVariation(ped)

	return ped

end

local creationPerso = {
	Base = { Title = "Mon Personnage", Blocked = true },
	Data = { currentMenu = "creation personnage" },
	Events = {
		onSelected = function(self, _, btn)
			if btn.name == "~g~Continuer & Sauvegarder" then
                saveSkin()
                self:CloseMenu(true)
            end
            
            if btn.name == "~g~Sauvegarder & Continuer" then
                savePed()
                self:CloseMenu(true)
			end
        end,
        
        onOpened = function(_, s)
			RequestStreamedTextureDict("pause_menu_pages_char_mom_dad", false)
			RequestStreamedTextureDict("char_creator_portraits", false)
			RequestStreamedTextureDict("mpleaderboard", false)
			RequestStreamedTextureDict("pause_menu_pages_char_mom_dad", false)
			RequestStreamedTextureDict("mpinventory", false)
        end,
        
        onSlide = function(menuData, currentButton, currentSlt, CMenu)

            local currentMenu, ped = menuData.currentMenu, GetPlayerPed(-1)
        
            if currentMenu == "votre sexe" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1

                if currentButton == 1 then
                    gender = 0
                    TriggerEvent('skinchanger:change', 'sex', 0)
                elseif currentButton == 2 then
                    gender = 1
                    TriggerEvent('skinchanger:change', 'sex', 1)
                end
        
                --print("sexe "..currentButton)
            end
        
            if currentMenu == "votre tête" then
                if currentSlt ~= 1 then return end
                currentButton = currentButton.slidenum - 1

                face = currentButton
                SetPedHeadBlendData(GetPlayerPed(-1), face, face, face, skin, skin, skin, 1.0, 1.0, 1.0, true)

                --print("visage "..currentButton)
            end

            if currentMenu == "votre peau" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                skin = currentButton
                SetPedHeadBlendData(GetPlayerPed(-1), face, face, face, skin, skin, skin, 1.0, 1.0, 1.0, true)
            
                --print("peau "..currentButton)
            end

            if currentMenu == "votre barbe" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                beard = currentButton
                SetPedHeadOverlay(GetPlayerPed(-1), 1, beard, 1.0)

                --print("barbe "..currentButton)
            end

            if currentMenu == "vos yeux" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                eyecolor = currentButton
                SetPedEyeColor(GetPlayerPed(-1), eyecolor)

                --print("yeux "..currentButton)
            end

            if currentMenu == "vos cheveux" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                hair = currentButton
                SetPedComponentVariation(GetPlayerPed(-1), 2, hair, 0, 0)

                --print("cheveux "..currentButton)
            end

            if currentMenu == "vos sourcils" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                eyebrow = currentButton
                SetPedHeadOverlay(GetPlayerPed(-1), 2, eyebrow, 1.0)

                --print("sourcils "..currentButton)
            end

            if currentMenu == "votre couleur pilositaire" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                beardcolor = currentButton
                SetPedHairColor(GetPlayerPed(-1), beardcolor, 0)
                SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, beardcolor, 0)
                SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, beardcolor, 0)

                --print("sourcils "..currentButton)
            end

            if currentMenu == "choisir son ped/skin" then
                if currentSlt ~= 1 then return end
                local sex = currentButton.slidenum - 1

                CMenu.Data.plySex = sex
                SetMPModel(GetMPModel(sex), CMenu)
            end

            if currentMenu == "vos imperfections" then
                if currentSlt ~= 1 then return end
                local skinproblem = currentButton.slidenum - 1
        
                SetPedHeadOverlay(GetPlayerPed(-1), 6, skinproblem, 1.0)
            end

            if currentMenu == "vos rides" then
                if currentSlt ~= 1 then return end
                local wrinkle = currentButton.slidenum - 1
        
                SetPedHeadOverlay(GetPlayerPed(-1), 3, wrinkle, 1.0)
            end
            
        end,


        onExited = function()

			SetStreamedTextureDictAsNoLongerNeeded("pause_menu_pages_char_mom_dad", false)
			SetStreamedTextureDictAsNoLongerNeeded("char_creator_portraits", false)
			SetStreamedTextureDictAsNoLongerNeeded("mpleaderboard", false)
			SetStreamedTextureDictAsNoLongerNeeded("pause_menu_pages_char_mom_dad", false)
			SetStreamedTextureDictAsNoLongerNeeded("mpinventory", false)
            --FreezeEntityPosition(PlayerPedId(), false)
            
		end,
	},

	Menu = {
		["creation personnage"] = {
			--slidertime = 75,
			b = {
                { name = "Personnage" },
                { name = "Ped/Skin" },
			}
        },

        ["ped/skin"] = {
			--slidertime = 75,
			b = {
                { name = "Choisir son ped/skin" },
                { name = "~g~Sauvegarder & Continuer" }
			}
        },

        ["choisir son ped/skin"] = {
			--slidertime = 75,
			b = {
                { name = "Ped/Skin", slidemax = pedList, Description = "Attention, les skin 'ped' ne peuvent pas être modifiés." },
			}
        },

        ["personnage"] = {
			--slidertime = 75,
			b = {
                { name = "Votre Sexe" },
                { name = "---------------------------------------------------------------------" },
                { name = "Votre Visage" },
                { name = "Votre Corps" },
                { name = "Votre Tenue" },
                { name = "---------------------------------------------------------------------" },
				{ name = "~g~Continuer & Sauvegarder" }
			}
        },

        ["votre visage"] = {
			charCreator = true,
			father = "male_1",
			mother = "female_1",
            slidertime = 75,
            
			b = {
                { name = "Votre Tête" },
                { name = "Votre Barbe" },
                { name = "Vos Yeux" },
                { name = "Vos Sourcils" },
				{ name = "Vos Cheveux" },
            }
        },

        ["votre corps"] = {
			charCreator = true,
			father = "male_1",
			mother = "female_1",
            slidertime = 75,
            
			b = {
                { name = "Votre Peau" },
                { name = "Votre couleur pilositaire" },
                { name = "Vos imperfections" },
                { name = "Vos rides" },
            }
        },

        ["vos rides"] = {
			charCreator = true,
			father = "male_1",
			mother = "female_1",
            slidertime = 75,
            
			b = {
                { name = "Rides", slidemax = 15, Description = "Le sexe de votre personnage"},
            }
        },

        ["vos imperfections"] = {
			charCreator = true,
			father = "male_1",
			mother = "female_1",
            slidertime = 75,
            
			b = {
                { name = "Imperfections", slidemax = 15, Description = "Le sexe de votre personnage"},
            }
        },

        ["votre tenue"] = {
			charCreator = true,
			father = "male_1",
			mother = "female_1",
            slidertime = 75,
            
			b = {
                { name = "Tenue 1" },
				{ name = "Tenue 2" },
            }
        },

        ["votre sexe"] = {
			charCreator = true,
			father = "male_1",
			mother = "female_1",
            slidertime = 75,
            
			b = {
                { name = "Sexe", slidemax = 2, Description = "Le sexe de votre personnage"},
			}
        },
        
        ["votre tête"] = {
			charCreator = true,
			father = "male_2",
			mother = "female_2",
			slidertime = 75,

			b = {
                { name = "Visage", slidemax = 14 },
			}
        },
        
        ["votre peau"] = {
			charCreator = true,
			father = "male_3",
			mother = "female_3",
			slidertime = 75,
			b = {
				{ name = "Peau", slidemax = 15, Description = "La peau de votre personnage"},
			}
        },

        ["vos yeux"] = {
			charCreator = true,
			father = "male_4",
			mother = "female_4",
			slidertime = 75,
			b = {
				{ name = "Yeux", slidemax = 20, Description = "Les yeux de votre personnage"},
			}
        },
        
        ["vos cheveux"] = {
			charCreator = true,
			father = "male_5",
			mother = "female_5",
			slidertime = 75,
			b = {
				{ name = "Cheveux", slidemax = 50, Description = "Les cheveux de votre personnage"},
			}
        },
        
        ["vos sourcils"] = {
			charCreator = true,
			father = "male_6",
			mother = "female_6",
			slidertime = 75,
			b = {
				{ name = "Sourcils", slidemax = 20, Description = "Les sourcils de votre personnage"},
			}
        },
        
        ["votre barbe"] = {
			charCreator = true,
			father = "male_7",
			mother = "female_7",
			slidertime = 75,
			b = {
				{ name = "Barbe", slidemax = 20, Description = "La barbe de votre personnage"},
			}
        },
        
        ["votre couleur pilositaire"] = {
			charCreator = true,
			father = "male_8",
			mother = "female_8",
			slidertime = 75,
			b = {
				{ name = "Couleur", slidemax = 15, Description = "La couleurs de votre pilosité de votre personnage"},
			}
		},
	}
}

function saveSkin()
    LoadingPrompt("Sauvegarde de votre personnalisation de personnage en cours", 3)

    local ped = GetPlayerPed(-1)
    local torso = GetPedDrawableVariation(ped, 3)
    local torsotext = GetPedTextureVariation(ped, 3)
    local leg = GetPedDrawableVariation(ped, 4)
    local legtext = GetPedTextureVariation(ped, 4)
    local shoes = GetPedDrawableVariation(ped, 6)
    local shoestext = GetPedTextureVariation(ped, 6)
    local accessory = GetPedDrawableVariation(ped, 7)
    local accessorytext = GetPedTextureVariation(ped, 7)
    local undershirt = GetPedDrawableVariation(ped, 8)
    local undershirttext = GetPedTextureVariation(ped, 8)
    local torso2 = GetPedDrawableVariation(ped, 11)
    local torso2text = GetPedTextureVariation(ped, 11)
    local prop_hat = GetPedPropIndex(ped, 0)
    local prop_hat_text = GetPedPropTextureIndex(ped, 0)
    local prop_glasses = GetPedPropIndex(ped, 1)
    local prop_glasses_text = GetPedPropTextureIndex(ped, 1)
    local prop_earrings = GetPedPropIndex(ped, 2)
    local prop_earrings_text = GetPedPropTextureIndex(ped, 2)
    local prop_watches = GetPedPropIndex(ped, 6)
    local prop_watches_text = GetPedPropTextureIndex(ped, 6)
    
    local skin_data = {["sex"]=gender,["face"]=face,["skin"]=skin,["eye_color"]=eyecolor,["complexion_1"]=skinproblem,["complexion_2"]=1,["moles_1"]=freckle,["moles_2"]=1,["age_1"]=wrinkle,["age_2"]=1,["eyebrows_1"]=eyebrow,["eyebrows_2"]=1,["beard_1"]=beard,["beard_2"]=1,["beard_3"]=beardcolor,["beard_4"]=beardcolor,["hair_1"]=hair,["hair_2"]=0,["hair_color_1"]=beardcolor,["hair_color_2"]=beardcolor,["arms"]=torso,["arms_2"]=torsotext,["pants_1"]=leg,["pants_2"]=legtext,["shoes_1"]=shoes,["shoes_2"]=shoestext,["chain_1"]=accessory,["chain_2"]=accessorytext,["tshirt_1"]=undershirt,["tshirt_2"]=undershirttext,["torso_1"]=torso2,["torso_2"]=torso2text,["helmet_1"]=prop_hat,["helmet_2"]=prop_hat_text,["glasses_1"]=prop_glasses,["glasses_2"]=prop_glasses_text,["ears_1"]=prop_earrings,["ears_2"]=prop_earrings_text,["watches_1"]=prop_watches,["watches_2"]=prop_watches_text}
    
    local charID = getCharID()

    TriggerServerEvent('corazon_character:saveSkin', skin_data, charID)

    Wait(5000)
    RemoveLoadingPrompt()
end

function savePed()
    LoadingPrompt("Sauvegarde de votre personnalisation de personnage en cours", 3)

    CMenu.Data.plySex = CMenu.Data.plySex or 0

    local ped, notMPModel = GetPlayerPed(-1), CMenu.Data.plySex > 1
    local sexeData = CMenu.Data.plySex or 0
    local charID = getCharID()

    TriggerServerEvent("corazon_character:savePed", sexeData, charID)
    
    Wait(5000)
    RemoveLoadingPrompt()
end

------------------------------------------------------------------------------
-- Grip Ped & Skin
local FirstSpawn     = true

RegisterNetEvent('corazon:spawnCharacterData')
AddEventHandler('corazon:spawnCharacterData', function()
    Citizen.CreateThread(function()
        if FirstSpawn then
            local charID = getCharID()

            if charID == 1 then

                TriggerServerCallback('corazon_character:getPlayerSkinOne', function(skin, ped)
                    if ped ~= nil then
                        TriggerEvent("corazon:charSaveSkin", ped)
                    elseif skin ~= nil then
                        TriggerEvent('skinchanger:loadSkin', skin)	
                    elseif ped == nil and skin == nil then
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)
                        TriggerEvent("corazon:createIdentity")
                    end
                end)

            elseif charID == 2 then

                TriggerServerCallback('corazon_character:getPlayerSkinTwo', function(skin, ped)
                    if ped ~= nil then
                        TriggerEvent("corazon:charSaveSkin", ped)
                    elseif skin ~= nil then
                        TriggerEvent('skinchanger:loadSkin', skin)	
                    elseif ped == nil and skin == nil then
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)
                        TriggerEvent("corazon:createIdentity")
                    end
                end)

            end
		end
	end)
end)


------------------------------------------------------------------------------
-- Spawn Ped



------------------------------------------------------------------------------
-- Spawn Skin


RegisterNetEvent("corazon.character:openCreationMenu")
AddEventHandler("corazon.character:openCreationMenu", function()
    RemoveLoadingPrompt()
    CreateMenu(creationPerso)
end)


RegisterCommand("character", function()
    CreateMenu(creationPerso)
end)