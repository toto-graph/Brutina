package com.gobelins.brutina {
import com.gobelins.brutina.Views.HomeView;
import com.gobelins.brutina.Views.TestView;

import starling.display.Sprite;
import starling.events.Event;

public class ViewsManager extends Sprite {

    private var _views:Array;
    private var _actual_view:int;

    public function ViewsManager() {
        _views = new Array();
        _views[Constants.VIEW_HOME] = new HomeView();
        _views[Constants.VIEW_TEST] = new TestView();

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        _actual_view = Constants.VIEW_HOME;
        addChild(_views[Constants.VIEW_HOME]);
    }

    public function setView(num:int):void {
        removeChild(_views[_actual_view]);
        _actual_view = num;
        addChild(_views[num]);
    }

}}