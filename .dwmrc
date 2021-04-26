/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=12" };
static const char dmenufont[]       = "monospace:size=12";
static const char col_fg[]          = "#f5f5f5";
static const char col_bg[]          = "#000000";
static const char *colors[][3]      = {
	/*               fg         bg   border   */
	[SchemeNorm] = { col_fg, col_bg, col_fg },
	[SchemeSel]  = { col_fg, col_bg, "#ff0000" },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ NULL,       NULL,       NULL,       0,            0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.60; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-b", "-m", dmenumon, "-fn", dmenufont, "-nb", col_bg, "-nf", col_fg, "-sb", col_fg, "-sf", col_bg, NULL };
static const char *termcmd[]  = { "/home/jfin/scripts/xterm", NULL };
static const char *scratchcmd[]  = { "/home/jfin/scripts/scratch", NULL };
static const char *brightnessdown[]  = { "sudo", "/home/jfin/scripts/brightness-down", NULL };
static const char *brightnessup[]  = { "sudo", "/home/jfin/scripts/brightness-up", NULL };
static const char *volumedown[]  = { "/home/jfin/scripts/volume-down", NULL };
static const char *volumeup[]  = { "/home/jfin/scripts/volume-up", NULL };
static const char *volumemute[]  = { "/home/jfin/scripts/volume-mute", NULL };

 static Key keys[] = {
  /* modifier           key                                  function          argument */
  { MODKEY|ShiftMask,   XK_semicolon,   spawn,            {.v = dmenucmd } },
  { MODKEY,             XK_Return,      spawn,            {.v = termcmd } },
  { 0,                  XK_grave,       spawn,            {.v = scratchcmd } },
  { 0,                  XF86XK_MonBrightnessDown, spawn,     {.v = brightnessdown } },
  { 0,                  XF86XK_MonBrightnessUp, spawn,       {.v = brightnessup } },
  { 0,                  XF86XK_AudioLowerVolume, spawn,      {.v = volumedown } },
  { 0,                  XF86XK_AudioRaiseVolume, spawn,      {.v = volumeup } },
  { 0,                  XF86XK_AudioMute, spawn,             {.v = volumemute } },
  { MODKEY,             XK_semicolon,   togglebar,        {0} },
  { MODKEY,             XK_j,           focusstack,       {.i = +1 } },
  { MODKEY,             XK_k,           focusstack,       {.i = -1 } },
  { MODKEY,             XK_i,           incnmaster,       {.i = +1 } },
  { MODKEY,             XK_o,           incnmaster,       {.i = -1 } },
  { MODKEY,             XK_h,           setmfact,         {.f = -0.1} },
  { MODKEY,             XK_l,           setmfact,         {.f = +0.1} },
  { MODKEY,             XK_u,           zoom,             {0} },
  { MODKEY,             XK_Tab,         view,             {0} },
  { MODKEY,             XK_backslash,   killclient,       {0} },
  { MODKEY,             XK_space,       setlayout,        {0} },
  { MODKEY,             XK_0,           view,             {.ui = ~0 } },
  { MODKEY|ShiftMask,   XK_0,           tag,              {.ui = ~0 } },
  { 0,                  0,              togglefloating,   {0} },
  { 0,                  0,              focusmon,         {0} },
  { 0,                  0,              tagmon,           {0} },
  TAGKEYS(              XK_1,                             0)
  TAGKEYS(              XK_2,                             1)
  TAGKEYS(              XK_3,                             2)
  TAGKEYS(              XK_4,                             3)
  TAGKEYS(              XK_5,                             4)
  TAGKEYS(              XK_6,                             5)
  TAGKEYS(              XK_7,                             6)
  TAGKEYS(              XK_8,                             7)
  TAGKEYS(              XK_9,                             8)
  { MODKEY|ShiftMask,   XK_backslash,   quit,             {0} },
 };


/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

