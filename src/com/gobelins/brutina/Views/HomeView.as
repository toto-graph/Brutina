/**
 * Created with IntelliJ IDEA.
 * User: Théo
 * Date: 24/09/13
 * Time: 20:27
 * To change this template use File | Settings | File Templates.
 */
package com.gobelins.brutina.Views {

import com.gobelins.brutina.Constants;
import com.gobelins.brutina.Game;

import starling.events.Event;
import starling.events.TouchEvent;
import starling.text.TextField;

public class HomeView extends View {

    public function HomeView() {
        super();
    }

    protected override function onAddedToStage(event:Event):void {
        var tf:TextField = new TextField(Constants.STAGE_WIDTH, Constants.STAGE_HEIGHT, "ON EST SUR LA HOME !!!");
        addChild(tf);

        tf.addEventListener(TouchEvent.TOUCH, function(event:TouchEvent):void {
            Game.views.setView(Constants.VIEW_TEST);
        });
    }

    protected override function onRemovedFromStage(event:Event):void {

    }

}}