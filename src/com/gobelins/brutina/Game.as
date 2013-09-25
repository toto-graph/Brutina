package com.gobelins.brutina {

import starling.display.Sprite;
import starling.utils.AssetManager;

public class Game extends Sprite
{

    public static var assets:AssetManager;
    public static var views:ViewsManager;
    public static var db:DbManager;
    public static var user:User;

    public function Game()
    {
        db = new DbManager();
        user = new User();

        views = new ViewsManager();
        addChild(views);
    }

    public function init(a:AssetManager):void {
        assets = a;
    }
}}