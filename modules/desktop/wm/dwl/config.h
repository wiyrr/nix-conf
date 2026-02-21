/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }
/* appearance */
static const int sloppyfocus               = 0;  /* focus follows mouse */
static const int bypass_surface_visibility = 0;  /* 1 means idle inhibitors will disable idle tracking even if it's surface isn't visible  */
static const unsigned int borderpx         = 1;  /* border pixel of windows */
static const float rootcolor[]             = COLOR(0x1e1e2eff);
static const float bordercolor[]           = COLOR(0x313244ff);
static const float focuscolor[]            = COLOR(0xb4befeff);
static const float urgentcolor[]           = COLOR(0xb4befeff);
/* This conforms to the xdg-protocol. Set the alpha to zero to restore the old behavior */
static const float fullscreen_bg[]         = {0.1f, 0.1f, 0.1f, 1.0f}; /* You can also use glsl colors */

/* tagging - TAGCOUNT must be no greater than 31 */
#define TAGCOUNT (9)

/* logging */
static int log_level = WLR_ERROR;

/* NOTE: ALWAYS keep a rule declared even if you don't use rules (e.g leave at least one example) */
static const Rule rules[] = {
	/* app_id             title       tags mask     isfloating   monitor */
	/* examples: */
	{ "thunderbird",  NULL,       1 << 8,       0,           -1 }, /* Start on ONLY tag "9" */
};

/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* monitors */
static const MonitorRule monrules[] = {
  { "eDP-1",    0.5f,  1,      1.5,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
	/* defaults */
	{ NULL,       0.5f, 1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
};

/* keyboard */
static const struct xkb_rule_names xkb_rules = {
	.options = NULL,
};

static const int repeat_rate = 40;
static const int repeat_delay = 200;

/* Trackpad */
static const int tap_to_click = 1;
static const int tap_and_drag = 1;
static const int drag_lock = 1;
static const int natural_scrolling = 0;
static const int disable_while_typing = 1;
static const int left_handed = 0;
static const int middle_button_emulation = 0;
static const enum libinput_config_scroll_method scroll_method = LIBINPUT_CONFIG_SCROLL_2FG;
static const enum libinput_config_click_method click_method = LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS;
static const uint32_t send_events_mode = LIBINPUT_CONFIG_SEND_EVENTS_ENABLED;
static const enum libinput_config_accel_profile accel_profile = LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT;
static const double accel_speed = 0.0;
static const enum libinput_config_tap_button_map button_map = LIBINPUT_CONFIG_TAP_MAP_LRM;

#define MODKEY WLR_MODIFIER_LOGO

#define TAGKEYS(KEY,SKEY,TAG) \
	{ MODKEY,                    KEY,            view,            {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL,  KEY,            toggleview,      {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_SHIFT, SKEY,           tag,             {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL|WLR_MODIFIER_SHIFT,SKEY,toggletag, {.ui = 1 << TAG} }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[] = { "foot", NULL };
static const char *browser[] = { "librewolf", NULL };
static const char *menucmd[] = { "tofi-launcher", NULL };

static const char *up_vol[]   = { "wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "0.05+",   NULL };
static const char *down_vol[] = { "wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "0.05-",   NULL };
static const char *mute_vol[] = { "wpctl", "set-mute",   "@DEFAULT_AUDIO_SINK@", "toggle", NULL };

static const char *up_brightness[]   = { "brightnessctl", "set", "+10%", NULL };
static const char *down_brightness[] = { "brightnessctl", "set", "10%-", NULL };

static const Key keys[] = {
	/* Note that Shift changes certain key codes: c -> C, 2 -> at, etc. */
	/* modifier                  key                 function        argument */
	{ MODKEY,                    XKB_KEY_q,          killclient,     {0} },
	// { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_q,          spawn,          {.v = ustop} },
	{ MODKEY,                    XKB_KEY_space,      spawn,          {.v = menucmd} },
	{ MODKEY,                    XKB_KEY_j,          spawn,          {.v = browser} },
	{ MODKEY,                    XKB_KEY_Return,     spawn,          {.v = termcmd} },
	{ MODKEY,                    XKB_KEY_a,          focusstack,     {.i = +1} },
	{ MODKEY,                    XKB_KEY_c,          focusstack,     {.i = -1} },
	// { MODKEY,                    XKB_KEY_comma,      incnmaster,     {.i = +1} },
	// { MODKEY,                    XKB_KEY_i,          incnmaster,     {.i = -1} },
	{ MODKEY,                    XKB_KEY_minus,      setmfact,       {.f = -0.05f} },
	{ MODKEY,                    XKB_KEY_equal,      setmfact,       {.f = +0.05f} },
	// { MODKEY,                    XKB_KEY_Return,     zoom,           {0} },
	{ MODKEY,                    XKB_KEY_Tab,        view,           {0} },
	// { MODKEY,                    XKB_KEY_b,          setlayout,      {.v = &layouts[0]} },
	// { MODKEY,                    XKB_KEY_v,          setlayout,      {.v = &layouts[1]} },
	// { MODKEY,                    XKB_KEY_m,          setlayout,      {.v = &layouts[2]} },
	// { MODKEY,                    XKB_KEY_c,      setlayout,      {0} },
	// { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_V,      togglefloating, {0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_F,         togglefullscreen, {0} },
	{ MODKEY,                    XKB_KEY_0,          view,           {.ui = ~0} },
	// { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_parenright, tag,            {.ui = ~0} },
	// { MODKEY,                    XKB_KEY_comma,      focusmon,       {.i = WLR_DIRECTION_LEFT} },
	// { MODKEY,                    XKB_KEY_period,     focusmon,       {.i = WLR_DIRECTION_RIGHT} },
	// { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_less,       tagmon,         {.i = WLR_DIRECTION_LEFT} },
	// { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_greater,    tagmon,         {.i = WLR_DIRECTION_RIGHT} },

  { 0, XKB_KEY_XF86AudioRaiseVolume, spawn, {.v = up_vol } },
  { 0, XKB_KEY_XF86AudioLowerVolume, spawn, {.v = down_vol } },
  { 0, XKB_KEY_XF86AudioMute, spawn, {.v = mute_vol } },

  { 0, XKB_KEY_XF86MonBrightnessUp,   spawn, {.v = up_brightness } },
  { 0, XKB_KEY_XF86MonBrightnessDown, spawn, {.v = down_brightness } },

	TAGKEYS(          XKB_KEY_1, XKB_KEY_exclam,                     0),
	TAGKEYS(          XKB_KEY_2, XKB_KEY_at,                         1),
	TAGKEYS(          XKB_KEY_3, XKB_KEY_numbersign,                 2),
	TAGKEYS(          XKB_KEY_4, XKB_KEY_dollar,                     3),
	TAGKEYS(          XKB_KEY_5, XKB_KEY_percent,                    4),
	TAGKEYS(          XKB_KEY_6, XKB_KEY_asciicircum,                5),
	TAGKEYS(          XKB_KEY_7, XKB_KEY_ampersand,                  6),
	TAGKEYS(          XKB_KEY_8, XKB_KEY_asterisk,                   7),
	TAGKEYS(          XKB_KEY_9, XKB_KEY_parenleft,                  8),
	TAGKEYS(          XKB_KEY_n, XKB_KEY_N,                          0),
	TAGKEYS(          XKB_KEY_t, XKB_KEY_T,                          1),
	TAGKEYS(          XKB_KEY_h, XKB_KEY_H,                          2),
	TAGKEYS(          XKB_KEY_p, XKB_KEY_P,                          3),
	TAGKEYS(          XKB_KEY_d, XKB_KEY_D,                          4),
	TAGKEYS(          XKB_KEY_semicolon, XKB_KEY_colon,              5),
	TAGKEYS(          XKB_KEY_u, XKB_KEY_U,                          6),
	TAGKEYS(          XKB_KEY_o, XKB_KEY_O,                          7),
	TAGKEYS(          XKB_KEY_y, XKB_KEY_Y,                          8),

	/* Ctrl-Alt-Backspace and Ctrl-Alt-Fx used to be handled by X server */
	{ WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_Terminate_Server, quit, {0} },
	/* Ctrl-Alt-Fx is used to switch to another VT, if you don't know what a VT is
	 * do not remove them.
	 */
#define CHVT(n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_XF86Switch_VT_##n, chvt, {.ui = (n)} }
	CHVT(1), CHVT(2), CHVT(3), CHVT(4), CHVT(5), CHVT(6),
	CHVT(7), CHVT(8), CHVT(9), CHVT(10), CHVT(11), CHVT(12),
};

static const Button buttons[] = {
	{ MODKEY, BTN_LEFT,   moveresize,     {.ui = CurMove} },
	{ MODKEY, BTN_MIDDLE, togglefloating, {0} },
	{ MODKEY, BTN_RIGHT,  moveresize,     {.ui = CurResize} },
};
