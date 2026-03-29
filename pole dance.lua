/**
 * @name Gothic Noir Ultimate
 * @author Gemini
 * @description Forced background visibility with Gothic font and Black/White theme.
 */

@import url('https://fonts.googleapis.com/css2?family=UnifrakturMaguntia&display=swap');

:root {
    --font-primary: 'UnifrakturMaguntia', serif;
    --font-display: 'UnifrakturMaguntia', serif;

    /* FORCE TRANSPARENCY ON ALL LAYERS */
    --background-primary: transparent !important;
    --background-secondary: rgba(0, 0, 0, 0.4) !important;
    --background-secondary-alt: rgba(0, 0, 0, 0.6) !important;
    --background-tertiary: rgba(0, 0, 0, 0.7) !important;
    --background-floating: #000 !important;
    --bg-overlay-chat: transparent !important;
    --bg-overlay-app-frame: transparent !important;
    
    /* BLACK & WHITE COLORS */
    --text-normal: #ffffff !important;
    --header-primary: #ffffff !important;
    --interactive-normal: #ffffff !important;
    --brand-experiment: #ffffff !important; /* Buttons/Links */
}

/* APPLY GOTHIC FONT */
* {
    font-family: var(--font-primary) !important;
}

/* THE FIX: Inject image into the very last layer of the app */
#app-mount::before {
    content: "";
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: url('https://files.catbox.moe/xrv4h5.png') center/cover no-repeat !important;
    pointer-events: none;
    z-index: -1;
}

/* PUNCH THROUGH ALL SOLID CONTAINERS */
#app-mount,
[class^="app_"],
[class^="bg_"],
[class^="container_"],
[class^="chat_"],
[class^="content_"],
[class^="sidebar_"],
[class^="panels_"],
[class^="standardSidebarView_"],
[class^="layer_"] {
    background: transparent !important;
}

/* ADD A DARK FILTER OVER THE IMAGE SO WHITE TEXT IS READABLE */
#app-mount::after {
    content: "";
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0, 0, 0, 0.5); /* 50% darkness overlay */
    z-index: -1;
    pointer-events: none;
}
