package _0h3
{
   import _ju._0O_M_;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _W_Q_.TextButton;
   import _B_T_._lZ_;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import flash.display.Shape;
   import com.company.rotmg.graphics.ScreenGraphic;
   
   public class _4i extends _0O_M_
   {
       
      
      public var _fX_:Signal;
      
      public var back:Signal;
      
      private var _00M_:SimpleText;
      
      private var _1oK_:TextButton;
      
      private var _90:SimpleText;
      
      private var _0mD_:_lZ_;
      
      public function _4i()
      {
         this._fX_ = new Signal(String);
         this.back = new Signal();
         this._00M_ = this._1lN_();
         this._1oK_ = this._0rd();
         this._90 = this._y6();
         super();
         addChild(this._eA_());
         addChild(this._00M_);
         addChild(new ScreenGraphic());
         addChild(this._1oK_);
      }
      
      private function _x6(param1:MouseEvent) : void
      {
         this.back.dispatch();
      }
      
      public function _0W_O_(param1:Vector.<String>) : void
      {
         this._0mD_ = new _lZ_(param1);
         this._0mD_.y = 100;
         this._0mD_.addEventListener(Event.CHANGE,this._b8);
         addChild(this._0mD_);
         this._90.textChanged.addOnce(this._1R_4);
         addChild(this._90);
         this._90.y = this._0mD_.y + this._0mD_._1qJ_() / 2;
      }
      
      private function _1R_4() : void
      {
         this._0mD_.x = 800 / 2 - (this._0mD_.width + this._90.width + 10) / 2;
         this._90.x = this._0mD_.x + this._0mD_.width + 10;
      }
      
      public function setSelected(param1:String) : void
      {
         this._0mD_ && this._0mD_.setValue(param1);
      }
      
      private function _b8(param1:Event) : void
      {
         this._fX_.dispatch(this._0mD_.getValue());
      }
      
      private function _1lN_() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(36).setColor(16777215);
         _loc1_.setBold(true);
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._Y_1));
         _loc1_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc1_.filters = [new DropShadowFilter(0,0,0)];
         _loc1_.x = 800 / 2 - _loc1_.width / 2;
         _loc1_.y = 16;
         return _loc1_;
      }
      
      private function _0rd() : TextButton
      {
         var _loc1_:TextButton = null;
         _loc1_ = new TextButton(_1O_I_._064,36,false);
         _loc1_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc1_.setVerticalAlign(SimpleText.MIDDLE);
         _loc1_.addEventListener(MouseEvent.CLICK,this._x6);
         _loc1_.x = 400;
         _loc1_.y = 550;
         return _loc1_;
      }
      
      private function _y6() : SimpleText
      {
         var _loc1_:SimpleText = new SimpleText().setSize(16).setColor(11776947).setBold(true);
         _loc1_.setVerticalAlign(SimpleText.MIDDLE);
         _loc1_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._0F_K_));
         return _loc1_;
      }
      
      private function _eA_() : Shape
      {
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.lineStyle(1,6184542);
         _loc1_.graphics.moveTo(0,70);
         _loc1_.graphics.lineTo(800,70);
         _loc1_.graphics.lineStyle();
         return _loc1_;
      }
      
      public function clear() : void
      {
         if(this._0mD_ && contains(this._0mD_))
         {
            removeChild(this._0mD_);
         }
      }
   }
}
