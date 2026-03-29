/**
 * @name Noir Gothic Glass
 * @author Gemini
 * @description Pure Black & White theme with your Catbox background and Fraktur font.
 */

@import url('https://fonts.googleapis.com/css2?family=UnifrakturMaguntia&display=swap');

:root {
    --font-primary: 'UnifrakturMaguntia', serif;
    
    /* PURE BLACK & WHITE PALETTE */
    --background-primary: rgba(0, 0, 0, 0.7) !important;       /* Dark glass chat */
    --background-secondary: rgba(0, 0, 0, 0.85) !important;    /* Darker sidebars */
    --background-tertiary: #000000 !important;                /* Pitch black server list */
    
    --header-primary: #ffffff !important;                     /* Pure white headers */
    --text-normal: #ffffff !important;                         /* Pure white text */
    --text-muted: #aaaaaa !important;                         /* Light gray for less important text */
    --interactive-normal: #ffffff !important;
    --interactive-hover: #ffffff !important;
    --interactive-active: #ffffff !important;
    --brand-experiment: #ffffff !important;                   /* Replaces blue with white */
    
    --channeltextarea-background: rgba(255, 255, 255, 0.1) !important; /* Glassy input box */
}

/* 1. Global Font & High Contrast Text */
* {
    font-family: var(--font-primary) !important;
    text-shadow: 0 0 1px rgba(255, 255, 255, 0.2); /* Very subtle glow for readability */
}

/* 2. Background Image Setup */
body::before {
    content: "";
    position: fixed;
    top: 0; left: 0;
    width: 100vw; height: 100vh;
    background: url('https://files.catbox.moe/xrv4h5.png') center/cover no-repeat;
    z-index: -100;
}

/* 3. Remove all Discord colors */
#app-mount, [class^="app_"], [class^="bg_"], [class^="layer_"], [class^="container_"] {
    background: transparent !important;
}

/* 4. Scrollbar styling (Black & White) */
::-webkit-scrollbar-thumb {
    background-color: #ffffff !important;
    border-radius: 0px !important;
}
::-webkit-scrollbar-track {
    background-color: #000000 !important;
}

/* 5. Clean up Borders */
[class^="searchBar_"], [class^="guildSeparator_"] {
    background-color: transparent !important;
    border-bottom: 1px solid white;
}
