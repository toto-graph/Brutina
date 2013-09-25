package com.gobelins.brutina {
public class User {

    public var name:String;
    public var id:String;
    public var exists:Boolean;

    public function User() {
        var data:Array = Game.db.getUser();
        if ( data == null ) exists = false;
        else {
            exists = true;
        }
    }



}}