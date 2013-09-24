package com.gobelins.brutina {

import starling.display.Sprite;
import starling.utils.AssetManager;

public class Game extends Sprite
{

    public static var assets:AssetManager;
    public static var views:ViewsManager;

    public function Game()
    {
        views = new ViewsManager();
        addChild(views);
    }

    public function init(_assets:AssetManager):void {
        assets = _assets;
    }
}}