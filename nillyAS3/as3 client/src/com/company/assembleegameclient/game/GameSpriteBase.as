package com.company.assembleegameclient.game
{
   import flash.display.Sprite;
   import _f7.Signal;
   import com.company.assembleegameclient.tutorial.Tutorial;
   import com.company.assembleegameclient.map._76;
   import _v4.Client;
   import _05g.UserHud;
   import com.company.assembleegameclient.map.View;
   import Packets.PacketManagerBase;
   import com.company.assembleegameclient.objects.GameObject;
   import Packets.Server.MapInfo;
   
   public class GameSpriteBase extends Sprite
   {
       
      
      public const closed:Signal = new Signal();
      
      public var isEditor:Boolean;
      
      public var tutorial_:Tutorial;
      
      public var mui_:com.company.assembleegameclient.game.HotKeys;
      
      public var lastUpdate_:int;
      
      public var moveRecords_:com.company.assembleegameclient.game._1jV_;
      
      public var map:_76;
      
      public var model:Client;
      
      public var hudView:UserHud;
      
      public var camera_:View;
      
      public var gsc_:PacketManagerBase;
      
      public function GameSpriteBase()
      {
         this.moveRecords_ = new com.company.assembleegameclient.game._1jV_();
         this.camera_ = new View();
         super();
      }
      
      public function initialize() : void
      {
      }
      
      public function setFocus(param1:GameObject, param2:Boolean = false) : void
      {
      }
      
      public function applyMapInfo(param1:MapInfo) : void
      {
      }
      
      public function evalIsNotInCombatMapArea() : Boolean
      {
         return false;
      }
   }
}
