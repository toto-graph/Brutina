package com.gobelins.brutina {

import flash.desktop.NativeApplication;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.system.Capabilities;

import starling.core.Starling;
import starling.events.Event;
import starling.utils.AssetManager;
import starling.utils.RectangleUtil;
import starling.utils.ScaleMode;

[SWF(width="320", height="480", frameRate="60", backgroundColor="#ffffff")]
public class Brutina extends Sprite
{
    private var _starling:Starling;
    private var _splashScreen:Bitmap;
    private var _viewPort:Rectangle;

    public function Brutina() : void
    {
        var stageWidth:int   = Constants.STAGE_WIDTH;
        var stageHeight:int  = Constants.STAGE_HEIGHT;
        var iOS:Boolean = Capabilities.manufacturer.indexOf("iOS") != -1;

        Starling.multitouchEnabled = true;  // useful on mobile devices
        Starling.handleLostContext = !iOS;  // not necessary on iOS. Saves a lot of memory!

        // create a suitable viewport for the screen size
        // we develop the game in a *fixed* coordinate system of 320x480; the game might
        // then run on a device with a different resolution; for that case, we zoom the
        // viewPort to the optimal size for any display and load the optimal textures.
        _viewPort = RectangleUtil.fit(
            new Rectangle(0, 0, stageWidth, stageHeight),
            new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight),
            ScaleMode.SHOW_ALL
        );

        // create the AssetManager, which handles all required assets for this resolution
        var scaleFactor:int = _viewPort.width < 480 ? 1 : 2; // midway between 320 and 640
        var assets:AssetManager = new AssetManager(scaleFactor);
        assets.verbose = Capabilities.isDebugger;

        showSplashScreen();

        // launch Starling
        _starling = new Starling(Game, stage, _viewPort);
        _starling.stage.stageWidth  = stageWidth;  // <- same size on all devices!
        _starling.stage.stageHeight = stageHeight; // <- same size on all devices!
        _starling.simulateMultitouch  = false;
        _starling.enableErrorChecking = Capabilities.isDebugger;
        _starling.start();

        // launch Game
        _starling.addEventListener(starling.events.Event.ROOT_CREATED,
            function onRootCreated (event:Object, app:Game):void {
                _starling.removeEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);

                removeChild(_splashScreen);
                app.init(assets);

                trace(1);
            }
        );

        // When the game becomes inactive, we pause Starling; otherwise, the enter frame event
        // would report a very long 'passedTime' when the app is reactivated.
        NativeApplication.nativeApplication.addEventListener( flash.events.Event.ACTIVATE, function (e:*):void { _starling.start(); });
        NativeApplication.nativeApplication.addEventListener( flash.events.Event.DEACTIVATE, function (e:*):void { _starling.stop(); });
    }

    private function showSplashScreen():void {
        _splashScreen = new Assets.SplashScreen();
        _splashScreen.x = _viewPort.x;
        _splashScreen.y = _viewPort.y;
        _splashScreen.width  = _viewPort.width;
        _splashScreen.height = _viewPort.height;
        _splashScreen.smoothing = true;
        addChild(_splashScreen);
    }

}}