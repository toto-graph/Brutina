package com.gobelins.brutina {
import com.gobelins.brutina.Views.HomeView;
import com.gobelins.brutina.Views.TestView;

import starling.display.Sprite;
import starling.events.Event;

public class ViewsManager extends Sprite {

    private var views:Array;
    private var actual_view:int;

    public function ViewsManager() {
        views = new Array();
        views[Constants.VIEW_HOME] = new HomeView();
        views[Constants.VIEW_TEST] = new TestView();

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        actual_view = Constants.VIEW_HOME;
        addChild(views[Constants.VIEW_HOME]);
    }

    public function setView(num:int):void {
        removeChild(views[actual_view]);
        actual_view = num;
        addChild(views[num]);
    }

}}