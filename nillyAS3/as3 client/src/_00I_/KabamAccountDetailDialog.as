package _00I_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import Frames.Frame;
   import _C_._1O_I_;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import _1xa.SText;
   import flash.events.MouseEvent;
   
   public class KabamAccountDetailDialog extends Sprite
   {
       
      
      public var _06H_:Signal;
      
      private var _0S___:SimpleText;
      
      private var _0m__:SimpleText;
      
      public function KabamAccountDetailDialog()
      {
         super();
         this._06H_ = new Signal();
      }
      
      public function _G_z(param1:String) : void
      {
         var _loc2_:Frame = null;
         _loc2_ = new Frame(_1O_I_._10__,"",_1O_I_._1O_A_,"/currentKabamLogin");
         addChild(_loc2_);
         this._0S___ = new SimpleText().setSize(18).setColor(11776947);
         this._0S___.setBold(true);
         this._0S___.setStringBuilder(new _dU_().setParams(_1O_I_._yf));
         this._0S___.filters = [new DropShadowFilter(0,0,0)];
         this._0S___.y = _loc2_.h_ - 60;
         this._0S___.x = 17;
         _loc2_.addChild(this._0S___);
         this._0m__ = new SimpleText().setSize(16).setColor(11776947).setTextWidth(238).setTextHeight(30);
         this._0m__.setStringBuilder(new SText(param1));
         this._0m__.y = _loc2_.h_ - 30;
         this._0m__.x = 17;
         _loc2_.addChild(this._0m__);
         _loc2_.h_ = _loc2_.h_ + 88;
         _loc2_.w_ = _loc2_.w_ + 60;
         _loc2_.actionButton.addEventListener(MouseEvent.CLICK,this._61);
      }
      
      private function _61(param1:MouseEvent) : void
      {
         this._06H_.dispatch();
      }
   }
}
