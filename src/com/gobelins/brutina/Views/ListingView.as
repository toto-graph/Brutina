package com.gobelins.brutina.Views {
import com.gobelins.brutina.Assets;
import com.gobelins.brutina.Constants;
import com.gobelins.brutina.Game;

import starling.display.Button;
import starling.events.Event;
import starling.textures.Texture;

public class ListingView extends View {

    public function ListingView() {
        //TODO: Delete all
        var testButton:Button = new Button(Texture.fromBitmap(new Assets.ValidateButton()), "Retour");
        testButton.width = Constants.STAGE_WIDTH - 40;
        testButton.height = 46;
        testButton.x = 20;
        testButton.y = 20;
        testButton.addEventListener(Event.TRIGGERED, function(event:Event):void {
            Game.views.setView(Constants.VIEW_NEW_USER);
        });

        addChild(testButton);
    }

    protected override function onAddedToStage(event:Event):void {}
    protected override function onRemovedFromStage(event:Event):void {}

}}