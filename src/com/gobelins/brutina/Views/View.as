package com.gobelins.brutina.Views {

import com.gobelins.brutina.Constants;

import starling.display.Sprite;
import starling.events.Event;

public class View extends Sprite {

    public function View() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);

        this.x = 0;
        this.y = 0;
        this.width = Constants.STAGE_WIDTH;
        this.height = Constants.STAGE_HEIGHT;
    }

    protected function onRemovedFromStage(event:Event):void {}
    protected function onAddedToStage(event:Event):void {}

}}