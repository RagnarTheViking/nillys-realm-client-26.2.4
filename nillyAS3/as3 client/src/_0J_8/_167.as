package _0J_8
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _17B_.XImageButton;
   import _1gF_.SimpleText;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import _0xn._1uk;
   import _1xa.SText;
   import _1xa._dU_;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import _17B_._1dh;
   
   public class _167 extends Sprite
   {
      
      public static const _1Y_6:int = 20;
       
      
      public var register:Signal;
      
      public var cancel:Signal;
      
      protected var _q9:Number;
      
      protected var _P_m:Number;
      
      protected var _1D_r:XImageButton;
      
      protected var background:Sprite;
      
      protected var title:SimpleText;
      
      protected var desc:SimpleText;
      
      public function _167(param1:int = 288, param2:int = 150)
      {
         super();
         this._q9 = param1;
         this._P_m = param2;
         x = 800 / 2 - this._q9 / 2;
         y = 600 / 2 - this._P_m / 2;
         if(this.background == null)
         {
            this.background = this.makeModalBackground();
            addChild(this.background);
         }
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         if(this._1D_r != null)
         {
            this._1D_r.removeEventListener(MouseEvent.CLICK,this.onCloseClick);
         }
      }
      
      public function setWidth(param1:Number) : void
      {
         this._q9 = param1;
         x = 800 / 2 - this._q9 / 2;
         this._eM_();
      }
      
      public function _0N_t(param1:Number) : void
      {
         this._P_m = param1;
         y = 600 / 2 - this._P_m / 2;
         this._eM_();
      }
      
      public function setTitle(param1:String, param2:Boolean) : void
      {
         if(param1 != null)
         {
            this.title = this._1g8(param1,_1Y_6,5,param2);
         }
         else
         {
            this.title = null;
         }
         this._eM_();
      }
      
      public function _1U_G_(param1:String, param2:Boolean) : void
      {
         if(param1 != null)
         {
            if(this.desc != null)
            {
               this.desc._0D_S_(param1);
            }
            else
            {
               this.desc = this._1g8(param1,_1Y_6,50,param2);
               addChild(this.desc);
            }
         }
      }
      
      public function _ml(param1:Boolean) : void
      {
         if(this._1D_r == null && param1)
         {
            this._1D_r = _1uk._V_w(this._q9);
            this._1D_r.addEventListener(MouseEvent.CLICK,this.onCloseClick);
            addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
            addChild(this._1D_r);
         }
         else if(this._1D_r != null && !param1)
         {
            removeChild(this._1D_r);
            this._1D_r = null;
         }
      }
      
      protected function _1g8(param1:String, param2:int, param3:int, param4:Boolean) : SimpleText
      {
         var _loc5_:SimpleText = null;
         _loc5_ = new SimpleText().setSize(16).setColor(16777215).setTextWidth(this._q9 - _1Y_6 * 2);
         _loc5_.setBold(true);
         if(param4)
         {
            _loc5_.setStringBuilder(new SText(param1));
         }
         else
         {
            _loc5_.setStringBuilder(new _dU_().setParams(param1));
         }
         _loc5_.setWordWrap(true);
         _loc5_.setMultiLine(true);
         _loc5_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc5_.setHorizontalAlign(TextFormatAlign.CENTER);
         _loc5_.filters = [new DropShadowFilter(0,0,0)];
         _loc5_.x = param2;
         _loc5_.y = param3;
         return _loc5_;
      }
      
      protected function makeModalBackground() : Sprite
      {
         x = 800 / 2 - this._q9 / 2;
         y = 600 / 2 - this._P_m / 2;
         var _loc1_:_1dh = new _1dh();
         _loc1_.draw(this._q9,this._P_m,_1dh._v3);
         if(this.title != null)
         {
            _loc1_._0yq(_1dh.HORIZONTAL_DIVISION,30);
         }
         return _loc1_;
      }
      
      protected function _eM_() : void
      {
         removeChildren();
         this.background = this.makeModalBackground();
         addChild(this.background);
         if(this._1D_r != null)
         {
            addChild(this._1D_r);
         }
         if(this.title != null)
         {
            addChild(this.title);
         }
         if(this.desc != null)
         {
            addChild(this.desc);
         }
      }
      
      public function onCloseClick(param1:MouseEvent) : void
      {
      }
   }
}
