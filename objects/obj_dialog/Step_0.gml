/// @description Displaying text
// Displays one more character per frame to produce typewriter effect

if (currCharIndex < string_length(dialog[dialogIndex, 1]) + 1) {
	spriteToDisplay = dialog[dialogIndex, 0];
	if (frames_waited == frames_per_char) {
		stringToDisplay += string_char_at(dialog[dialogIndex, 1], currCharIndex);
		currCharIndex++;
		if (frames_waited > 1) {
			frames_waited = 1;
		}
	}
	else {
		frames_waited++;
	}
	// Add functionality to press key to skip current printing here
} else {
	// Press this key to display new line of text
	if (keyboard_check_pressed(key_for_new_line)) { 
		dialogIndex++;
		stringToDisplay = "";
		currCharIndex = 1; // STRING INDEXING STARTS AT 1 
		
		// hide dialog window when all dialog lines are run
		if (dialogIndex == dialogCount)
		{
			for (var i = 0; i < max_lines_of_dialog; i++) {
				dialog[i, 0] = -1; //sprite index
				dialog[i, 1] = ""; //dialog
			}
			active = false;
		}
	}
}