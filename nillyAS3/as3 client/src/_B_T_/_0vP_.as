package _B_T_
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import _f7.Signal;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   
   public class _0vP_ extends Sprite
   {
       
      
      public var w_:int;
      
      public var h_:int;
      
      private var name_:String;
      
      private var nameText_:SimpleText;
      
      private var _X_V_:_dU_;
      
      public function _0vP_(param1:String, param2:int, param3:int)
      {
         this._X_V_ = new _dU_();
         super();
         this.w_ = param2;
         this.h_ = param3;
         this.name_ = param1;
         mouseChildren = false;
         this.nameText_ = new SimpleText().setSize(16).setColor(11776947).setBold(true);
         this.nameText_.setStringBuilder(this._X_V_.setParams(param1));
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.nameText_);
         this._1W_A_(3552822);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      public function _1pv() : Signal
      {
         return this.nameText_.textChanged;
      }
      
      public function getValue() : String
      {
         return this.name_;
      }
      
      public function setValue(param1:String) : void
      {
         this.name_ = param1;
         this.nameText_.setStringBuilder(this._X_V_.setParams(param1));
      }
      
      public function setWidth(param1:int) : void
      {
         this.w_ = param1;
         this.nameText_.x = this.w_ / 2 - this.nameText_.width / 2;
         this.nameText_.y = this.h_ / 2 - this.nameText_.height / 2;
         this._1W_A_(3552822);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._1W_A_(5658198);
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._1W_A_(3552822);
      }
      
      private function _1W_A_(param1:uint) : void
      {
         graphics.clear();
         graphics.lineStyle(2,5526612);
         graphics.beginFill(param1,1);
         graphics.drawRect(0,0,this.w_,this.h_);
         graphics.endFill();
         graphics.lineStyle();
      }
   }
}
