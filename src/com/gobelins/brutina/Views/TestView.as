package com.gobelins.brutina.Views {

import com.gobelins.brutina.Constants;
import com.gobelins.brutina.Game;

import starling.events.Event;
import starling.events.TouchEvent;
import starling.text.TextField;

public class TestView extends View {

    public function TestView() {
        super();
    }

    protected override function onAddedToStage(event:Event):void {
        var tf:TextField = new TextField(Constants.STAGE_WIDTH, Constants.STAGE_HEIGHT, "ON EST SUR LA PAGE DE TEST !!!");
        addChild(tf);

        tf.addEventListener(TouchEvent.TOUCH, function(event:TouchEvent):void {
            Game.views.setView(Constants.VIEW_HOME);
        });
    }

    protected override function onRemovedFromStage(event:Event):void {

    }

}}