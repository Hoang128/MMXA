/// @description Step

if (!init)
{
    var pos = audio_sound_get_track_position(bgm);
    bgmLength = global.BGM_intro + global.BGM_loop;
    if (pos>bgmLength) audio_sound_set_track_position(bgm, pos - global.BGM_loop);
}