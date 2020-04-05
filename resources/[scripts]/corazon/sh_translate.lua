Langues = {}

function _(str, ...)  -- Translate string
	if Langues[Config.Language] ~= nil then
		if Langues[Config.Language][str] ~= nil then
			return string.format(Langues[Config.Language][str], ...)
		else
			return 'Translation [' .. Config.Language .. '][' .. str .. '] does not exist'
		end
	else
		return 'Locale [' .. Config.Language .. '] does not exist'
	end
end

function translate(str, ...) -- Translate string first char uppercase
	return tostring(_(str, ...):gsub("^%l", string.upper))
end


Langues['english'] = {
  ['choice_char'] = "Choice of character",
  ['character'] = "Character",
  ['unemployed'] = "Unemployed",
  ['slotvide'] = "~p~      FREE SLOT",
  ['name'] = "Firstname & Lastname",
  ['cash'] = "Cash",
  ['bank'] = "Bank",
  ['dirty'] = "Dirty",
  ['occupation'] = "Job",
  ['loading_in_progress'] = "Loading in progress",
  ['wait_select_char'] = "Wait to select a character",
  ['connected_to_server'] = "~g~Connected to the server",
  ['my_charnnage'] = "My Character",
  ['fake_identity'] = "Fake Identity",
  ['save_character_creator'] = "Saving your character customization in progress",
  ['problem_rediriged'] = "A problem has occurred, redirect in progress",
  ['waiting'] = "Please wait",
  ['error_identity_creator'] = "~r~Please note.~n~~w~You have not correctly filled in your character's identity.",
  ['identity_nomrp'] = "Last name & First name",
  ['identity_lieudn'] = "Place of birth",
  ['identity_jourdn'] = "Day of birth",
  ['identity_moisdn'] = "Birth month",
  ['identity_annedn'] = "Year of birth",
  ['identity_continue'] = "~g~Continue",
  ['cl_character_sex'] = "your sex",
  ['cl_character_head'] = "your head",
  ['cl_character_hide'] = "your hide",
  ['cl_character_beard'] = "your beard",
  ['cl_character_beardb'] = "Beard",
  ['cl_character_eye'] = "your eyes",
  ['cl_character_eyeb'] = "Yeux",
  ['cl_character_hair'] = "your hairs",
  ['cl_character_hairb'] = "Hairs",
  ['cl_character_eyebrow'] = "your eyebrow",
  ['cl_character_eyebrowb'] = "Eyebrow",
  ['cl_character_haircolor'] = "your hair color",
  ['cl_character_color'] = "Color",
  ['cl_character_imperfections'] = "your imperfections",
  ['cl_character_wrinkles'] = "your wrinkles",
  ['cl_character_face'] = "your face",
  ['cl_character_body'] = "your body",
  ['cl_character_outfit'] = "your outfit",
  ['cl_character_outfita'] = "Outfit 1",
  ['cl_character_outfitb'] = "Outfit 2",
  ['cl_character_continue'] = "~g~Continue & Save"
}

Langues['french'] = {
  ['choice_char'] = "Choix Personnage",
  ['character'] = "Personnage",
  ['unemployed'] = "Sans Emploi",
  ['slotvide'] = "~p~      SLOT LIBRE",
  ['name'] = "Nom & Prenom",
  ['cash'] = "Espece",
  ['bank'] = "Banque",
  ['dirty'] = "Sale",
  ['occupation'] = "Metier",
  ['loading_in_progress'] = "Chargement en cours",
  ['wait_select_char'] = "En attente de la selection du personnage",
  ['connected_to_server'] = "~g~Connectée au serveur",
  ['my_charnnage'] = "Mon Personnage",
  ['fake_identity'] = "Fausse Identité",
  ['save_character_creator'] = "Sauvegarde de votre personnalisation de personnage en cours",
  ['problem_rediriged'] = "Un problème est survenu, redirection en cours",
  ['waiting'] = "Veuillez patienter",
  ['error_identity_creator'] = "~r~Attention.~n~~w~Vous n'avez pas correctement complété l'année de naissance de votre personnage.",
  ['identity_nomrp'] = "Nom & Prénom",
  ['identity_lieudn'] = "Lieu de naissance",
  ['identity_jourdn'] = "Jour de naissance",
  ['identity_moisdn'] = "Mois de naissance",
  ['identity_annedn'] = "Année de naissance",
  ['identity_continue'] = "~g~Continuer",
  ['cl_character_sex'] = "votre sexe",
  ['cl_character_head'] = "votre tête",
  ['cl_character_hide'] = "votre peau",
  ['cl_character_beard'] = "votre barbe",
  ['cl_character_beardb'] = "Barbe",
  ['cl_character_eye'] = "vos yeux",
  ['cl_character_eyeb'] = "Yeux",
  ['cl_character_hair'] = "vos cheveux",
  ['cl_character_hairb'] = "Cheveux",
  ['cl_character_eyebrow'] = "vos sourcils",
  ['cl_character_eyebrowb'] = "Sourcils",
  ['cl_character_haircolor'] = "votre couleur pilositaire",
  ['cl_character_color'] = "Couleur",
  ['cl_character_imperfections'] = "vos imperfections",
  ['cl_character_wrinkles'] = "vos rides",
  ['cl_character_face'] = "votre visage",
  ['cl_character_body'] = "votre corp",
  ['cl_character_outfit'] = "votre tenue",
  ['cl_character_outfita'] = "Tenue 1",
  ['cl_character_outfitb'] = "Tenue 2",
  ['cl_character_continue'] = "~g~Continuer & Sauvegarder"
}


