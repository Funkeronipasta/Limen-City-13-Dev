/*
	output_atoms	(list of atoms)			The destination(s) for the sounds

	mid_sounds		(list or soundfile)		Since this can be either a list or a single soundfile you can have random sounds. May contain further lists but must contain a soundfile at the end.
	mid_length		(num)					The length to wait between playing mid_sounds

	start_sound		(soundfile)				Played before starting the mid_sounds loop
	start_length	(num)					How long to wait before starting the main loop after playing start_sound

	end_sound		(soundfile)				The sound played after the main loop has concluded

	chance			(num)					Chance per loop to play a mid_sound
	volume			(num)					Sound output volume
	muted			(bool)					Private. Used to stop the sound loop.
	max_loops		(num)					The max amount of loops to run for.
	direct			(bool)					If true plays directly to provided atoms instead of from them
	opacity_check	(bool)					If true, things behind walls/opaque things won't hear the sounds.
	pref_check		(type)					If set to a /datum/client_preference type, will check if the hearer has that preference active before playing it to them.
*/
/datum/looping_sound
	var/list/atom/output_atoms
	var/mid_sounds
	var/mid_length
	var/start_sound
	var/start_length
	var/end_sound
	var/chance
	var/volume = 100
	var/max_loops
	var/direct
	var/vary
	var/extra_range
	var/opacity_check
	var/pref_check
	var/soundenvdry
	var/soundenvwet

	var/timerid

/datum/looping_sound/New(list/_output_atoms=list(), start_immediately=FALSE, _direct=FALSE)
	if(!mid_sounds)
		WARNING("A looping sound datum was created without sounds to play.")
		return

	if(isatom(_output_atoms))
		_output_atoms = list(_output_atoms)
	output_atoms = _output_atoms
	direct = _direct

	if(start_immediately)
		start()

/datum/looping_sound/Destroy()
	stop()
	output_atoms = null
	return ..()

/datum/looping_sound/proc/start(atom/add_thing)
	if(add_thing)
		output_atoms |= add_thing
	if(timerid)
		return
	on_start()

/datum/looping_sound/proc/stop(atom/remove_thing)
	if(remove_thing)
		output_atoms -= remove_thing
	if(!timerid)
		return
	on_stop()
	deltimer(timerid)
	timerid = null

/datum/looping_sound/proc/sound_loop(starttime)
	if(max_loops && (world.time >= (starttime + mid_length * max_loops)))
		stop()
		return
	if(!chance || prob(chance))
		play(get_sound(starttime))
	if(!timerid)
		timerid = addtimer(CALLBACK(src, .proc/sound_loop, world.time), mid_length, TIMER_STOPPABLE | TIMER_LOOP)

/datum/looping_sound/proc/play(soundfile)
	var/list/atoms_cache = output_atoms
	var/sound/S = sound(soundfile)
	if(direct)
		S.channel = SSsounds.random_available_channel()
		S.volume = volume
	for(var/i in 1 to atoms_cache.len)
		var/atom/thing = atoms_cache[i]
		if(direct)
			if(ismob(thing))
				var/mob/M = thing
				if(!M.is_preference_enabled(pref_check))
					continue
			SEND_SOUND(thing, S)
		else
			playsound(thing, S, volume, vary, extra_range, ignore_walls = !opacity_check, preference = pref_check)

/datum/looping_sound/proc/get_sound(starttime, _mid_sounds)
	if(!_mid_sounds)
		. = mid_sounds
	else
		. = _mid_sounds
	while(!isfile(.) && !isnull(.))
		. = pickweight(.)

/datum/looping_sound/proc/on_start()
	var/start_wait = 1 // On TG this is 0, however it needs to be 1 to work around an issue.
	if(start_sound)
		play(start_sound)
		start_wait = start_length
	addtimer(CALLBACK(src, .proc/sound_loop), start_wait)

/datum/looping_sound/proc/on_stop()
	if(end_sound)
		play(end_sound)