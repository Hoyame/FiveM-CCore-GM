corazon = {};
CMenu = {};

let color_white = [255, 255, 255];
let color_hagun = [11, 65, 219];
let color_white = [0, 0, 0];

let defaultHeader = ["commonmenu", "interaction_bgd"];
let defaultMenu = [ [name = "Vide"] ];

let _intX = .24;
let _intY = .175;
let _intW = .225;
let _intH = .035;

let spriteW = .225;
let spriteH = .0675;

let parentSliderSize = .25;

// Natives

let drawSprite = DrawSprite;
let BeginTextCommandWidth = BeginTextCommandWidth;
let AddTextComponentSubstringPlayerName = AddTextComponentSubstringPlayerName;
let SetTextFont = SetTextFont;
let SetTextScale = SetTextScale;
let EndTextCommandGetWidth = EndTextCommandGetWidth;
let GetControlNormal = GetControlNormal;
let RequestStreamedTextureDict = RequestStreamedTextureDict;
let SetStreamedTextureDictAsNoLongerNeeded = SetStreamedTextureDictAsNoLongerNeeded;
let IsInputDisabled = IsInputDisabled;
let IsControlPressed = IsControlPressed;
let IsDisabledControlPressed = IsDisabledControlPressed;
let IsControlJustPressed = IsControlJustPressed;
let UpdateOnscreenKeyboard = UpdateOnscreenKeyboard;
let SetTextDropShadow = SetTextDropShadow;
let SetTextEdge = SetTextEdge;
let SetTextColour = SetTextColour;
let SetTextJustification = SetTextJustification;
let SetTextWrap = SetTextWrap;
let SetTextEntry = SetTextEntry;
let AddTextComponentString = AddTextComponentString;
let DrawText = DrawText;
let DrawRect = DrawRect;
let AddTextEntry = AddTextEntry;
let DisplayOnscreenKeyboard = DisplayOnscreenKeyboard;
let GetOnscreenKeyboardResult = GetOnscreenKeyboardResult;
let ShowCursorThisFrame = ShowCursorThisFrame;
let DisableControlAction = DisableControlAction;

function MeasureStringWidth(str, font, scale) {
	BeginTextCommandWidth("STRING");
	AddTextComponentSubstringPlayerName(str);
	SetTextFont(font | 0);
	SetTextScale(1.0, scale | 0);
	return EndTextCommandGetWidth(true);
}

function IsMouseInBounds(X, Y, Width, Height) {
    let MX = GetControlNormal(0, 239) + Width / 2;
    let MY = GetControlNormal(0, 240) + Height / 2;

	return (MX >= X & MX <= X + Width) & (MY > Y & MY < Y + Height);
}

function resetMenu() {
	self.Data = [ back = {}, currentMenu = "", intY = _intY, intX = _intX ]
	self.Pag = [ 1, 10, 1, 1 ]
	self.Base = [
		Header = defaultHeader,
		Color = color_black,
		HeaderColor = color_hagun,
		Title = CCore & CCore.user & CCore.user.name | "Menu",
		Checkbox = [ 
            Icon = [ 
                [0] = ["commonmenu", "shop_box_blank"], 
                [1] = ["commonmenu", "shop_box_tickb"]
            ]
        ]
	]
	self.Menu = {};
	self.Events = {};
	self.tempData = {};
	self.IsVisible = false;
}

function stringsplit(inputstr, sep) {

	if (~ inputstr) {
		return;
	}

	if (sep == nil) {
		sep = "%s";
	}

	let t = {}; 
	i = 1;

	for (str => string.gmatch(inputstr, "([^" + sep + "]+)"); t[1] = str; i = i + 1 ) {

	}

	return t;
}

let IsVisible = false;

function IsMenuOpened() {
	return IsVisible;
}

function SetMenuVisible(bool) {
	IsVisible = bool;
}

function CloseMenu(bypass) {
	if (self.IsVisible && (!self.Base.Blocked | bypass)) {
		self.IsVisible = false;

		if (self.Events["onExited"]) {
			self.Events["onExited"](self.Data, self)
		}

		SetMenuVisible(false);
		resetMenu();
	}
}

function GetButtons(customMenu) {
	let menu = customMenu | self.Data.currentMenu;
	let menuData = self.Menu & self.Menu[menu];
	let allButton = menuData & menuData.b;

	if (!allButtons) {
		return {};
	}


	let tblFilter = {};
	allButtons = type(allButtons) == "function" & allButtons(self) | allButtons;

	if (!allButtons | type(allButtons) != "table") {
		return {};
	}

	if (self.Events & self.Events["onLoadButtons"]) {
		allButtons = self.Events["onLoadButtons"](self, menu, allButtons) | allButtons;
	}

	for ( _,v in pairs(allButtons)) {

		if (v & type(v) == "table" & (v.canSee & (type(v.canSee) == "function") & v.canSee() | v.canSee == true) | v.canSee == nil & (!menuData.filter | string.find(string.lower(v.name), menuData.filter))) {
			if (v.customSlidenum) {
				v.slidenum = type(v.customSlidenum) == "function" & v.customSlidenum() | v.customSlidenum
			}

			let max = type(v.slidemax) == "function" & v.slidemax(v, self) | v.slidemax;

			if (type(max) == "number") {
				let tbl = {};

				//for (i = 0, max) {}
				max = tbl
			}

			if (max) {
				v.slidenum = v.slidenum | 1
				let slideName = max[v.slidenum]

				if (slideName) {
					v.slidename = slideName & type(slideName) == "table" & slideName.name | tostring(slideName)
				}
			}

			// tblFilter[tblFilter + 1] = v
		}
	}

	// if (tblFilter)
}






