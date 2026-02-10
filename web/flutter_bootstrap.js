{ { flutter_js } }
{ { flutter_build_config } }

_flutter.loader.load({
    onEntrypointLoaded: async function (engineInitializer) {
        const appRunner = await engineInitializer.initializeEngine();
        await appRunner.runApp();

        // Flutter has rendered — fade out and remove the native splash
        var splash = document.getElementById("splash");
        if (splash) {
            splash.classList.add("hidden");
            setTimeout(function () { splash.remove(); }, 350);
        }
    }
});
