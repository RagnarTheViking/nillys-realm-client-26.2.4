package _1H_T_
{
   import flash.utils.Timer;
   import flash.geom.Point;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import _1O_n._zL_;
   
   public class _S_A_ extends _0U_J_
   {
      
      private static const _0P_k:uint = 250;
      
      private static const _R_i:int = 3;
       
      
      private var _P_2:Timer;
      
      private var _170:Point;
      
      private var _f:Boolean;
      
      private var _07R_:Boolean;
      
      public function _S_A_(param1:int, param2:_zL_, param3:Boolean)
      {
         super(param1,param2);
         mouseChildren = false;
         this._P_2 = new Timer(_0P_k,1);
         this._P_2.addEventListener(TimerEvent.TIMER_COMPLETE,this._0v4);
         this._P_e(param3);
      }
      
      public function _P_e(param1:Boolean) : void
      {
         if(param1)
         {
            addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
            addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         }
         else
         {
            removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      public function _1v() : DisplayObject
      {
         return _1lh.dropTarget;
      }
      
      protected function beginDragCallback() : void
      {
      }
      
      protected function endDragCallback() : void
      {
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._G_h(false);
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         if(this._07R_)
         {
            return;
         }
         if(param1.shiftKey)
         {
            this._G_h(false);
            dispatchEvent(new _12U_(_12U_.ITEM_SHIFT_CLICK,this));
         }
         else if(param1.ctrlKey)
         {
            this._G_h(false);
            dispatchEvent(new _12U_(_12U_.ITEM_CTRL_CLICK,this));
         }
         else if(!this._f)
         {
            this._G_h(true);
         }
         else
         {
            this._G_h(false);
            dispatchEvent(new _12U_(_12U_.ITEM_DOUBLE_CLICK,this));
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._1wQ_(param1);
      }
      
      private function _G_h(param1:Boolean) : void
      {
         this._f = param1;
         if(this._f)
         {
            this._P_2.reset();
            this._P_2.start();
         }
         else
         {
            this._P_2.stop();
         }
      }
      
      private function _1wQ_(param1:MouseEvent) : void
      {
         this._170 = new Point(param1.stageX,param1.stageY);
         addEventListener(MouseEvent.MOUSE_MOVE,this._1F_8);
         addEventListener(MouseEvent.MOUSE_OUT,this._j7);
         addEventListener(MouseEvent.MOUSE_UP,this._j7);
      }
      
      private function _j7(param1:MouseEvent) : void
      {
         removeEventListener(MouseEvent.MOUSE_MOVE,this._1F_8);
         removeEventListener(MouseEvent.MOUSE_OUT,this._j7);
         removeEventListener(MouseEvent.MOUSE_UP,this._j7);
      }
      
      private function _1F_8(param1:MouseEvent) : void
      {
         var _loc2_:Number = param1.stageX - this._170.x;
         var _loc3_:Number = param1.stageY - this._170.y;
         var _loc4_:Number = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
         if(_loc4_ > _R_i)
         {
            this._j7(null);
            this._G_h(false);
            this._gm(param1);
         }
      }
      
      private function _0v4(param1:TimerEvent) : void
      {
         this._G_h(false);
         dispatchEvent(new _12U_(_12U_.ITEM_CLICK,this));
      }
      
      private function _gm(param1:MouseEvent) : void
      {
         this._07R_ = true;
         stage.addChild(_1lh);
         _1lh.startDrag(true);
         _1lh.x = param1.stageX;
         _1lh.y = param1.stageY;
         _1lh.addEventListener(MouseEvent.MOUSE_UP,this._00d);
         this.beginDragCallback();
      }
      
      private function _00d(param1:MouseEvent) : void
      {
         this._07R_ = false;
         _1lh.stopDrag();
         _1lh.removeEventListener(MouseEvent.MOUSE_UP,this._00d);
         dispatchEvent(new _12U_(_12U_.ITEM_MOVE,this));
         this.endDragCallback();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this._G_h(false);
         this._j7(null);
         if(this._07R_)
         {
            _1lh.stopDrag();
         }
      }
   }
}
