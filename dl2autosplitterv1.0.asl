state("flashplayer_32_sa") {
	int scene : 0xC95B64, 0x24, 0xA8C, 0x4, 0x2C, 0x50, 0x264, 0x4C;
}

startup {
	refreshRate = 100;

	settings.Add("minigames", false, "Split when entering minigames.");
	settings.CurrentDefaultParent = "minigames";
	settings.Add("12", false, "Enter Flying");
	settings.Add("15", false, "Enter Running");
	settings.Add("18", false, "Enter Swimming");
	settings.Add("21", false, "Enter Climbing");

	settings.CurrentDefaultParent = null;

	settings.Add("finals", false, "Split when finishing area finals.");
	settings.CurrentDefaultParent = "finals";
	settings.Add("30", false, "Scotland");
	settings.Add("37", false, "England");
	settings.Add("44", false, "Egypt");
	settings.Add("51", false, "Hawaii");
	settings.Add("56", false, "Japan");

	settings.SetToolTip("minigames", "This is mostly intended for No Tab and Any% No Major Glitches.");
	settings.SetToolTip("finals", "This is mostly intended for ALU, however all runs end timing just before the Japan split.");
}

start {
	return old.scene == 7 && current.scene == 8;
}

split {
	return settings[current.scene.ToString()] && old.scene != current.scene;
}