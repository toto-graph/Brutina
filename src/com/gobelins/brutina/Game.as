package com.gobelins.brutina {

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.AssetManager;

public class Game extends Sprite
{

    public static var assets:AssetManager;

    public function Game()
    {
        var textField:TextField = new TextField(Constants.STAGE_WIDTH, Constants.STAGE_HEIGHT, "Welcome to Starling!");
        addChild(textField);
    }

    public function init(_assets:AssetManager):void {
        assets = _assets;

        trace('INIT!!!!!!!!');
    }
}}