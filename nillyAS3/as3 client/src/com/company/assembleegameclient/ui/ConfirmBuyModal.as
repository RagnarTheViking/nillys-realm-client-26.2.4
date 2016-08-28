package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import _17B_._1dh;
   import _17B_.XImageButton;
   import _T_n._1gJ_;
   import _1S_0._1mh;
   import com.company.assembleegameclient.objects.SellableObject;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import _0xn._1uk;
   import _C_._1O_I_;
   import com.company.assembleegameclient.util.Currency;
   
   public class ConfirmBuyModal extends Sprite
   {
      
      public static const WIDTH:int = 280;
      
      public static const HEIGHT:int = 185;
      
      public static const _1Y_6:int = 20;
      
      public static var _pc:Boolean = true;
       
      
      private const _1D_r:XImageButton = _1uk._V_w(WIDTH);
      
      private const buyButton:_1gJ_ = new _1gJ_(_1O_I_._0A_w,16,0,Currency.INVALID);
      
      private var _L_Z_:_1mh;
      
      private var _1od:SellableObject;
      
      public var _kz:Signal;
      
      public var open:Boolean;
      
      public var _M_c:int;
      
      public function ConfirmBuyModal(param1:Signal, param2:SellableObject, param3:Number)
      {
         super();
         _pc = false;
         this._kz = param1;
         this._1od = param2;
         this._M_c = param3;
         this.events();
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._C_h();
         this._0sF_();
         this.buyButton.setPrice(this._1od.price_,this._1od.currency_);
         var _loc4_:String = this._1od.soldObjectName();
         addChild(this._1g8(_1O_I_._1ir,_1Y_6,5));
         addChild(this._1g8(_1O_I_._1uE_,_1Y_6,40));
         addChild(this._1g8(_loc4_,_1Y_6,100));
         this.open = true;
      }
      
      private static function makeModalBackground(param1:int, param2:int) : _1dh
      {
         var _loc3_:_1dh = new _1dh();
         _loc3_.draw(param1,param2);
         _loc3_._0yq(_1dh.HORIZONTAL_DIVISION,30);
         return _loc3_;
      }
      
      public function _1g8(param1:String, param2:int, param3:int) : SimpleText
      {
         var _loc4_:SimpleText = null;
         _loc4_ = new SimpleText().setSize(16).setColor(16777215).setTextWidth(WIDTH - _1Y_6 * 2);
         _loc4_.setBold(true);
         _loc4_.setStringBuilder(new _dU_().setParams(param1));
         _loc4_.setWordWrap(true);
         _loc4_.setMultiLine(true);
         _loc4_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc4_.setHorizontalAlign(TextFormatAlign.CENTER);
         _loc4_.filters = [new DropShadowFilter(0,0,0)];
         _loc4_.x = param2;
         _loc4_.y = param3;
         return _loc4_;
      }
      
      private function _C_h() : void
      {
         var _loc1_:* = -300;
         var _loc2_:* = -200;
         this.x = _loc1_ + -1 * WIDTH * 0.5;
         this.y = _loc2_ + -1 * HEIGHT * 0.5;
         this.buyButton.x = this.buyButton.x + 35;
         this.buyButton.y = this.buyButton.y + 142;
         this.buyButton.x = WIDTH / 2 - this._M_c / 2;
      }
      
      private function events() : void
      {
         this._1D_r.clicked.add(this.onCloseClick);
         this._L_Z_ = new _1mh(this.buyButton,MouseEvent.CLICK,MouseEvent);
         this._L_Z_.add(this._1yU_);
      }
      
      private function _0sF_() : void
      {
         addChild(makeModalBackground(WIDTH,HEIGHT));
         addChild(this._1D_r);
         addChild(this.buyButton);
      }
      
      public function onCloseClick() : void
      {
         this.close();
      }
      
      public function _1yU_(param1:MouseEvent) : void
      {
         this._kz.dispatch(this._1od);
         this.close();
      }
      
      private function close() : void
      {
         parent.removeChild(this);
         _pc = true;
         this.open = false;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         _pc = true;
         this.open = false;
      }
   }
}
