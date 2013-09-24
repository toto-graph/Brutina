package com.gobelins.brutina.Views {

import starling.display.Sprite;
import starling.events.Event;

public class View extends Sprite {

    public function View() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    protected function onRemovedFromStage(event:Event):void {}
    protected function onAddedToStage(event:Event):void {}

}}