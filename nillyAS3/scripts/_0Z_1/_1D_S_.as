package _0Z_1
{
   import flash.display.DisplayObjectContainer;
   import com.company.assembleegameclient.ui._1E_f;
   import _Y_M_.PlayerMenu;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.ui._1vJ_;
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.objects.PlayerList;
   import flash.utils.getTimer;
   import com.company.util.MoreColorUtil;
   import com.company.assembleegameclient.game.GameSprite;
   
   public class _1D_S_ extends Panel
   {
       
      
      public var _pn:DisplayObjectContainer;
      
      public var _o7:Vector.<_1E_f>;
      
      public var _0K_Q_:Boolean;
      
      public var menu:PlayerMenu;
      
      public function _1D_S_(param1:GameSprite)
      {
         this._o7 = new Vector.<_1E_f>(PlayerList.MaxCount,true);
         super(param1);
         this._o7[0] = this._037(0,0);
         this._o7[1] = this._037(100,0);
         this._o7[2] = this._037(0,32);
         this._o7[3] = this._037(100,32);
         this._o7[4] = this._037(0,64);
         this._o7[5] = this._037(100,64);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function _037(param1:int, param2:int) : _1E_f
      {
         var _loc3_:_1E_f = new _1E_f(16777215,false,null);
         addChild(_loc3_);
         _loc3_.x = param1;
         _loc3_.y = param2;
         return _loc3_;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var _loc2_:_1E_f = null;
         for each(_loc2_ in this._o7)
         {
            _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            _loc2_.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
            _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         }
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         var _loc2_:_1E_f = null;
         this._4q();
         for each(_loc2_ in this._o7)
         {
            _loc2_.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            _loc2_.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
            _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         }
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         if(this.menu != null && this.menu.parent != null)
         {
            return;
         }
         var _loc2_:_1E_f = param1.currentTarget as _1E_f;
         var _loc3_:Player = _loc2_.go as Player;
         if(_loc3_ == null || _loc3_.texture_ == null)
         {
            return;
         }
         this._0K_Q_ = true;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._0K_Q_ = false;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._4q();
         var _loc2_:_1E_f = param1.currentTarget as _1E_f;
         _loc2_.setEnabled(false);
         this.menu = new PlayerMenu();
         this.menu.init(gs_,_loc2_.go as Player);
         this._pn.addChild(this.menu);
         this.menu.addEventListener(Event.REMOVED_FROM_STAGE,this._0V_F_);
      }
      
      private function _0V_F_(param1:Event) : void
      {
         var _loc2_:_1vJ_ = null;
         var _loc3_:_1E_f = null;
         for each(_loc2_ in this._o7)
         {
            _loc3_ = _loc2_ as _1E_f;
            if(_loc3_)
            {
               _loc3_.setEnabled(true);
            }
         }
         param1.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE,this._0V_F_);
      }
      
      private function _4q() : void
      {
         if(this.menu != null)
         {
            this.menu.remove();
            this.menu = null;
         }
      }
      
      override public function draw() : void
      {
         var _loc1_:_1vJ_ = null;
         var _loc2_:Player = null;
         var _loc3_:ColorTransform = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc6_:PlayerList = gs_.map.playerList_;
         if(_loc6_ == null)
         {
            for each(_loc1_ in this._o7)
            {
               _loc1_.clear();
            }
            return;
         }
         while(_loc8_ < PlayerList.MaxCount)
         {
            if(this._0K_Q_ || this.menu != null && this.menu.parent != null)
            {
               _loc2_ = this._o7[_loc8_].go as Player;
            }
            else
            {
               _loc2_ = _loc6_.players[_loc8_];
            }
            if(_loc2_ != null && _loc2_.map_ == null)
            {
               _loc2_ = null;
            }
            _loc3_ = null;
            if(_loc2_ != null)
            {
               if(_loc2_.hp_ < _loc2_.maxHp_ * 0.2)
               {
                  if(_loc7_ == 0)
                  {
                     _loc7_ = getTimer();
                  }
                  _loc4_ = int(Math.abs(Math.sin(_loc7_ / 200)) * 10) / 10;
                  _loc5_ = 128;
                  _loc3_ = new ColorTransform(1,1,1,1,_loc4_ * _loc5_,-_loc4_ * _loc5_,-_loc4_ * _loc5_);
               }
               if(!_loc2_.starred_)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.concat(MoreColorUtil._J_J_);
                  }
                  else
                  {
                     _loc3_ = MoreColorUtil._J_J_;
                  }
               }
            }
            this._o7[_loc8_].draw(_loc2_,_loc3_);
            _loc8_++;
         }
      }
   }
}
