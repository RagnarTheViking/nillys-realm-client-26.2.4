package _0E_Z_
{
   import flash.display.Sprite;
   import _1R_o._Y_5;
   import _1R_o._0xf;
   import ToolTips.ToolTip;
   import _f7.Signal;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.display.BitmapData;
   import ToolTips.EquipmentToolTip;
   import _0qE_._016;
   
   public class _0qm extends Sprite implements _Y_5
   {
       
      
      private var itemId:int;
      
      public var _18D_:_0xf;
      
      private var tooltip:ToolTip;
      
      public var onMouseOver:Signal;
      
      public var onMouseOut:Signal;
      
      public var _7v:Bitmap;
      
      public function _0qm(param1:int, param2:int = 100, param3:Boolean = false)
      {
         this._18D_ = new _0xf();
         this.onMouseOver = new Signal();
         this.onMouseOut = new Signal();
         super();
         this.itemId = param1;
         var _loc4_:BitmapData = ObjectLibrary.getRedrawnTextureFromType(param1,param2,true,false);
         var _loc5_:BitmapData = ObjectLibrary.getRedrawnTextureFromType(param1,param2,true,false);
         this._7v = new Bitmap(_loc5_);
         addChild(this._7v);
         this._18D_._bD_(this);
         this.tooltip = new EquipmentToolTip(param1,null,-1,_016.NPC);
         this.tooltip._15P_();
         this._18D_.tooltip = this.tooltip;
         if(param3)
         {
            addEventListener(Event.REMOVED_FROM_STAGE,this._0ax);
            addEventListener(MouseEvent.ROLL_OVER,this._86);
            addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         }
      }
      
      public function _P_E_() : void
      {
         this._18D_._uZ_();
      }
      
      public function _D_() : void
      {
         this._18D_._bD_(this);
      }
      
      private function _0ax(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this._0ax);
         removeEventListener(MouseEvent.ROLL_OVER,this._86);
         removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this.onMouseOver.removeAll();
         this.onMouseOut.removeAll();
      }
      
      private function _86(param1:MouseEvent) : void
      {
         this.onMouseOver.dispatch();
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.onMouseOut.dispatch();
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this._18D_._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this._18D_._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._18D_._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this._18D_._fn();
      }
      
      public function setXPos(param1:Number) : void
      {
         this.x = param1 - this.width / 2;
      }
      
      public function setYPos(param1:Number) : void
      {
         this.y = param1 - this.height / 2;
      }
      
      public function getCenterX() : Number
      {
         return this.x + this.width / 2;
      }
      
      public function getCenterY() : Number
      {
         return this.y + this.height / 2;
      }
   }
}
