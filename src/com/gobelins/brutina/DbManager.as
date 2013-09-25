package com.gobelins.brutina {

import flash.data.SQLConnection;
import flash.data.SQLMode;
import flash.data.SQLResult;
import flash.data.SQLStatement;
import flash.filesystem.File;

public class DbManager {

    private var _file:File;
    private var _sqlConnectionSync:SQLConnection;

    public function DbManager() {
        _file = File.applicationStorageDirectory.resolvePath("brutina.db");
        _sqlConnectionSync = new SQLConnection();

        createDb();
    }

    private function createDb():void {
        _sqlConnectionSync.open(_file, SQLMode.CREATE);
        //if (_file.exists) return;

        var createDb:SQLStatement = new SQLStatement();
        createDb.text = "CREATE TABLE IF NOT EXISTS user (name VARCHAR(16) PRIMARY KEY, email VARCHAR(64))";
        createDb.sqlConnection = _sqlConnectionSync;
        createDb.execute();
    }

    public function getUser():Array {
        var read:SQLStatement = new SQLStatement();
        read.sqlConnection = _sqlConnectionSync;
        read.text = "SELECT * FROM user";
        read.execute();

        var result:SQLResult = read.getResult();
        return result.data;
    }

    /*//write the data
    private function writeData():void {
        var insert:SQLStatement = new SQLStatement(); //create the insert statement
        insert.sqlConnection = sqlConnectionSync; //set the connection
        insert.text = "INSERT INTO messages (subject, message) VALUES (?, ?)";
        insert.parameters[0] = subject.text;
        insert.parameters[1] = message.text;
        insert.execute();
        Alert.show("The data was saved into the table!");
    }

    //read the data
    private function readData():void {
        var read:SQLStatement = new SQLStatement(); //create the read statemen
        read.sqlConnection = sqlConnectionSync; //set the connection
        read.text = "SELECT id, subject, message FROM messages ORDER BY id";
        read.execute();
        var result:SQLResult = read.getResult(); //retrieve the result of the query
        myDatagrid.dataProvider = result.data; //display the array of objects into the data grid
    }*/


}}