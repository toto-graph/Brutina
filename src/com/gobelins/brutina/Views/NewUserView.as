package com.gobelins.brutina.Views {

import com.gobelins.brutina.Assets;
import com.gobelins.brutina.Constants;
import com.gobelins.brutina.Game;

import feathers.controls.TextInput;

import starling.display.Button;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;

public class NewUserView extends View {

    private var _nameInput:TextInput;
    private var _emailInput:TextInput;
    private var _validateButton:Button;
    private var _nameTextField:TextField;
    private var _emailTextField:TextField;
    private var _form:Sprite;
    private var _bg:Image;
    //TODO: Delete
    private var _testButton:Button;

    public function NewUserView() {
        super();

        _bg = new Image(Texture.fromBitmap(new Assets.NewUserBackground()));
        _bg.x = 0;
        _bg.y = 0;
        _bg.width  = Constants.STAGE_WIDTH;
        _bg.height = Constants.STAGE_HEIGHT;

        _form = new Sprite();
        _form.x = 0;
        _form.y = 210;
        _form.width  = Constants.STAGE_WIDTH;
        _form.height  = Constants.STAGE_HEIGHT - 210;

        _nameTextField = createTextField('Votre pseudo :', 20, 0);
        _emailTextField = createTextField('Votre email :', 20, 76);

        _nameInput = createInput();
        _nameInput.y = 20;
        _nameInput.maxChars = 16;

        _emailInput = createInput();
        _emailInput.y = 96;

        _validateButton = new Button(Texture.fromBitmap(new Assets.ValidateButton()), "Rejoindre l'aventure");
        _validateButton.width = Constants.STAGE_WIDTH - 40;
        _validateButton.height = 46;
        _validateButton.x = 20;
        _validateButton.y = 152;
        _validateButton.addEventListener(Event.TRIGGERED, onValidate);

        //TODO: Delete
        _testButton = new Button(Texture.fromBitmap(new Assets.ValidateButton()), "Listing");
        _testButton.width = Constants.STAGE_WIDTH - 40;
        _testButton.height = 46;
        _testButton.x = 20;
        _testButton.y = 208;
        _testButton.addEventListener(Event.TRIGGERED, function(event:Event):void {
            Game.views.setView(Constants.VIEW_LISTING);
        });
    }

    private function onValidate(event:Event):void {
        _validateButton.removeEventListener(Event.TRIGGERED, onValidate);
        //Game.views.setView(Constants.VIEW_HOME);
    }

    protected override function onAddedToStage(event:Event):void {
        addChild(_bg);
        addChild(_form);
        _form.addChild(_nameTextField);
        _form.addChild(_emailTextField);
        _form.addChild(_nameInput);
        _form.addChild(_emailInput);
        _form.addChild(_validateButton);

        //TODO: Delete
        _form.addChild(_testButton);
    }

    private function createInput():TextInput {
        var input:TextInput = new TextInput();

        input.width = Constants.STAGE_WIDTH - 40;
        input.height = 46;
        input.x = 20;
        input.paddingTop = 15;
        input.paddingRight = 15;
        input.paddingBottom = 15;
        input.paddingLeft = 15;
        input.backgroundSkin = new Image(Texture.fromBitmap(new Assets.Input()));
        input.backgroundFocusedSkin = new Image(Texture.fromBitmap(new Assets.Input()));
        input.textEditorProperties.color = 0xFFFFFF;
        input.textEditorProperties.fontSize = 12;

        return input;
    }

    private function createTextField(label:String, x:int, y:int):TextField {
        var t:TextField = new TextField(Constants.STAGE_WIDTH - 40, 20, label);
        t.x = x;
        t.y = y;
        t.color = 0xFFFFFF;
        t.fontSize = 12;
        t.hAlign = "left";

        return t;
    }

}}