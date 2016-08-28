package com.company.assembleegameclient.game
{
   import _0jo._0oc;
   import flash.events.MouseEvent;
   import flash.events.KeyboardEvent;
   import flash.events.StatusEvent;
   import flash.events.Event;
   import _05L_.ChatMessage;
   import com.company.assembleegameclient.parameters.Parameters;
   import _0H_6.GameContext;
   
   public class IdleWatch
   {
      
      private static const MIN:int = 60 * 1000;
      
      private static const WARNING_1:int = 4;
      
      private static const KICK:int = 5;
       
      
      public var gs_:com.company.assembleegameclient.game.GameSprite = null;
      
      public var idleTime:int = 0;
      
      private var _V_8:_0oc;
      
      private var wd:com.company.assembleegameclient.game.SpeedWatchDog;
      
      private var _isSpeedHacking:Boolean;
      
      public function IdleWatch()
      {
         super();
         this._V_8 = GameContext.getInjector().getInstance(_0oc);
      }
      
      public function start(param1:com.company.assembleegameclient.game.GameSprite) : void
      {
         this.gs_ = param1;
         this.idleTime = 0;
         this.gs_.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.gs_.stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         this.wd = new com.company.assembleegameclient.game.SpeedWatchDog();
         this.wd.init(5000,0.08);
         this.wd.addEventListener(StatusEvent.STATUS,this.onSpeedHack);
      }
      
      private function onSpeedHack(param1:Event) : void
      {
         this.gs_.gsc_.cheating(1);
      }
      
      public function Update(param1:int) : Boolean
      {
         var _loc2_:int = this.idleTime;
         this.idleTime = this.idleTime + param1;
         if(this._isSpeedHacking)
         {
            return true;
         }
         if(this.idleTime < WARNING_1 * MIN)
         {
            return false;
         }
         if(this.idleTime >= WARNING_1 * MIN && _loc2_ < WARNING_1 * MIN)
         {
            this._V_8.dispatch(this._5X_());
            return false;
         }
         if(this.idleTime >= KICK * MIN && _loc2_ < KICK * MIN)
         {
            this._V_8.dispatch(this._kZ_());
            return true;
         }
         return false;
      }
      
      private function _5X_() : ChatMessage
      {
         var _loc1_:ChatMessage = new ChatMessage();
         _loc1_.name = Parameters.ErrorText;
         _loc1_.text = "You have been idle for " + WARNING_1 + " minutes, you will be disconnected if you are idle for " + "more than " + KICK + " minutes.";
         return _loc1_;
      }
      
      private function _kZ_() : ChatMessage
      {
         var _loc1_:ChatMessage = new ChatMessage();
         _loc1_.name = Parameters.ErrorText;
         _loc1_.text = "You have been idle for " + KICK + " minutes, disconnecting.";
         return _loc1_;
      }
      
      public function stop() : void
      {
         this.gs_.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.gs_.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         this.gs_ = null;
         this.wd.removeEventListener(StatusEvent.STATUS,this.onSpeedHack);
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this.idleTime = 0;
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         this.idleTime = 0;
      }
   }
}
