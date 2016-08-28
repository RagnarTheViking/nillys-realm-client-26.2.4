package _1dw
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui._03S_;
   import Frames.Frame;
   import _C_._1O_I_;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import _1xa.SText;
   import flash.events.MouseEvent;
   
   public class SteamAccountDetailDialog extends Sprite
   {
       
      
      public var _06H_:Signal;
      
      public var register:Signal;
      
      public var link:Signal;
      
      private var _0S___:SimpleText;
      
      private var _0m__:SimpleText;
      
      private var _0t8:SimpleText;
      
      private var _1H_A_:SimpleText;
      
      private var _cx:_03S_;
      
      public function SteamAccountDetailDialog()
      {
         super();
         this._06H_ = new Signal();
         this.register = new Signal();
      }
      
      public function _G_z(param1:String, param2:String, param3:Boolean) : void
      {
         var _loc4_:Frame = null;
         _loc4_ = new Frame(_1O_I_._F_q,"",_1O_I_._05K_,"/steamworksCurrentLogin");
         addChild(_loc4_);
         this._0S___ = new SimpleText().setSize(18).setColor(11776947);
         this._0S___.setBold(true);
         this._0S___.setStringBuilder(new _dU_().setParams(_1O_I_._hN_));
         this._0S___.filters = [new DropShadowFilter(0,0,0)];
         this._0S___.y = _loc4_.h_ - 60;
         this._0S___.x = 17;
         _loc4_.addChild(this._0S___);
         this._0m__ = new SimpleText().setSize(16).setColor(11776947);
         this._0m__.setTextWidth(238).setTextHeight(30);
         this._0m__.setStringBuilder(new SText(param1));
         this._0m__.y = _loc4_.h_ - 30;
         this._0m__.x = 17;
         _loc4_.addChild(this._0m__);
         _loc4_.h_ = _loc4_.h_ + 88;
         if(param3)
         {
            _loc4_.h_ = _loc4_.h_ - 20;
            this._0t8 = new SimpleText().setSize(18).setColor(11776947);
            this._0t8.setBold(true);
            this._0t8.setStringBuilder(new _dU_().setParams(_1O_I_._12));
            this._0t8.filters = [new DropShadowFilter(0,0,0)];
            this._0t8.y = _loc4_.h_ - 60;
            this._0t8.x = 17;
            _loc4_.addChild(this._0t8);
            this._1H_A_ = new SimpleText().setSize(16).setColor(11776947);
            this._1H_A_.setStringBuilder(new SText(param2));
            this._1H_A_.y = _loc4_.h_ - 30;
            this._1H_A_.x = 17;
            _loc4_.addChild(this._1H_A_);
            _loc4_.h_ = _loc4_.h_ + 88;
         }
         else
         {
            this._cx = new _03S_(12,false,_1O_I_._Z_s);
            this._cx.addEventListener(MouseEvent.CLICK,this._02T_);
            _loc4_._oP_(this._cx);
         }
         _loc4_.actionButton.addEventListener(MouseEvent.CLICK,this._61);
      }
      
      private function _61(param1:MouseEvent) : void
      {
         this._06H_.dispatch();
      }
      
      public function _02T_(param1:MouseEvent) : void
      {
         this.register.dispatch();
      }
   }
}
