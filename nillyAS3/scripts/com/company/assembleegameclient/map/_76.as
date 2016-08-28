package com.company.assembleegameclient.map
{
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import com.company.assembleegameclient.objects.Player;
   import _05G_.Background;
   import _113.MapOverlay;
   import _0bE_.PartyOverlay;
   import com.company.assembleegameclient.objects.PlayerList;
   import _f7.Signal;
   import com.company.assembleegameclient.objects.BasicObject;
   import flash.geom.Point;
   
   public class _76 extends Sprite
   {
       
      
      public var goDict_:Dictionary;
      
      public var gs_:GameSpriteBase;
      
      public var name_:String;
      
      public var player_:Player = null;
      
      public var spectatePlayer:Player = null;
      
      public var showDisplays_:Boolean;
      
      public var width_:int;
      
      public var height_:int;
      
      public var _1I_q:int;
      
      protected var allowPlayerTeleport_:Boolean;
      
      public var background_:Background = null;
      
      public var map_:Sprite;
      
      public var breathOverlay_:com.company.assembleegameclient.map.BreathOverlay = null;
      
      public var sideBarGradient:com.company.assembleegameclient.map.SideBarGradient = null;
      
      public var mapOverlay_:MapOverlay = null;
      
      public var partyOverlay_:PartyOverlay = null;
      
      public var _0bx:Vector.<com.company.assembleegameclient.map.Square>;
      
      public var squares_:Vector.<com.company.assembleegameclient.map.Square>;
      
      public var oDict_:Dictionary;
      
      public var merchLookup_:Object;
      
      public var playerList_:PlayerList = null;
      
      public var quest_:com.company.assembleegameclient.map.Quest = null;
      
      public var signalRenderSwitch:Signal;
      
      protected var hwAccel:Boolean = false;
      
      public var isPetYard:Boolean = false;
      
      public function _76()
      {
         this.goDict_ = new Dictionary();
         this.map_ = new Sprite();
         this._0bx = new Vector.<com.company.assembleegameclient.map.Square>();
         this.squares_ = new Vector.<com.company.assembleegameclient.map.Square>();
         this.oDict_ = new Dictionary();
         this.merchLookup_ = new Object();
         this.signalRenderSwitch = new Signal(Boolean);
         super();
      }
      
      public function setProps(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:Boolean) : void
      {
      }
      
      public function addObj(param1:BasicObject, param2:Number, param3:Number) : void
      {
      }
      
      public function setGroundTile(param1:int, param2:int, param3:uint) : void
      {
      }
      
      public function initialize() : void
      {
      }
      
      public function dispose() : void
      {
      }
      
      public function update(param1:int, param2:int) : void
      {
      }
      
      public function pSTopW(param1:Number, param2:Number) : Point
      {
         return null;
      }
      
      public function removeObj(param1:int) : void
      {
      }
      
      public function draw(param1:View, param2:int) : void
      {
      }
      
      public function allowTeleport() : Boolean
      {
         return this.allowPlayerTeleport_;
      }
      
      public function resetOverlays() : void
      {
      }
   }
}
