package _Y_8
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import _S_b._O_e;
   import com.company.assembleegameclient.objects.Player;
   import _0H_6.GameContext;
   import flash.utils.getTimer;
   import flash.geom.Rectangle;
   
   public class _nn extends Sprite
   {
      
      private static const _i6:uint = 20000;
       
      
      private var _1jR_:int;
      
      private var list:Vector.<DisplayObject>;
      
      private var count:uint;
      
      private var _0k8:uint;
      
      private var _6G_:uint;
      
      private var _1qW_:Boolean;
      
      public var _zb:int;
      
      public var playerName:String = "";
      
      public var _1G_s:Boolean = false;
      
      public var _04N_:Boolean = false;
      
      public function _nn(param1:Vector.<DisplayObject>, param2:int, param3:int, param4:Boolean, param5:int, param6:String, param7:Boolean, param8:Boolean)
      {
         super();
         mouseEnabled = true;
         this._1jR_ = param2;
         this._0k8 = param3;
         this.list = param1;
         this.count = param1.length;
         this._6G_ = getTimer();
         this._1qW_ = param4;
         this._zb = param5;
         this.playerName = param6;
         this._1G_s = param7;
         this._04N_ = param8;
         this._0H_q();
         this._B_Z_();
         addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._0I_t);
      }
      
      public function _0I_t(param1:MouseEvent) : void
      {
         var _loc2_:_O_e = null;
         var _loc3_:Player = null;
         try
         {
            _loc2_ = GameContext.getInjector().getInstance(_O_e);
            if(_loc2_._14O_.map.goDict_[this._zb] != null && _loc2_._14O_.map.goDict_[this._zb] is Player && _loc2_._14O_.map.player_.objectId_ != this._zb)
            {
               _loc3_ = _loc2_._14O_.map.goDict_[this._zb] as Player;
               _loc2_._14O_._9P_(_loc3_,param1.stageX,param1.stageY);
            }
            else if(!this._04N_ && this.playerName != null && this.playerName != "" && _loc2_._14O_.map.player_.name_ != this.playerName)
            {
               _loc2_._14O_._9P_(null,param1.stageX,param1.stageY,this.playerName,this._1G_s);
            }
            else if(this._04N_ && this.playerName != null && this.playerName != "" && _loc2_._14O_.map.player_.name_ != this.playerName)
            {
               _loc2_._14O_._9P_(null,param1.stageX,param1.stageY,this.playerName,false,true);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function _0P_P_() : Boolean
      {
         return getTimer() > this._6G_ + _i6 || this._1qW_;
      }
      
      private function _0H_q() : void
      {
         var _loc1_:int = 0;
         var _loc2_:DisplayObject = null;
         var _loc3_:Rectangle = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc1_ = 0;
         while(_loc5_ < this.count)
         {
            _loc2_ = this.list[_loc5_];
            _loc3_ = _loc2_.getRect(_loc2_);
            _loc2_.x = _loc1_;
            _loc2_.y = -_loc3_.height;
            if(_loc1_ + _loc3_.width > this._1jR_)
            {
               _loc2_.x = 0;
               _loc1_ = 0;
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  this.list[_loc4_].y = this.list[_loc4_].y - this._0k8;
                  _loc4_++;
               }
            }
            _loc1_ = _loc1_ + _loc3_.width;
            _loc5_++;
         }
      }
      
      private function _B_Z_() : void
      {
         var _loc1_:DisplayObject = null;
         for each(_loc1_ in this.list)
         {
            addChild(_loc1_);
         }
      }
   }
}
