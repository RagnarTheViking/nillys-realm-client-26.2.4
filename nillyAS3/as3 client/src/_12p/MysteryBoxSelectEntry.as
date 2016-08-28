package _12p
{
   import flash.display.Sprite;
   import _T_n._1gJ_;
   import _D_2.MysteryBoxInfo;
   import flash.display.DisplayObject;
   import _17B_._1dh;
   import _1gF_.SimpleText;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import flash.utils.getTimer;
   import _1xa._dU_;
   import _1xa.SText;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import _0H_6.GameContext;
   import _3b.DialogSignal;
   import com.company.assembleegameclient.util.Currency;
   
   public class MysteryBoxSelectEntry extends Sprite
   {
      
      public static var _0X_q:Class = _0N_v;
       
      
      private const buyButton:_1gJ_ = new _1gJ_("",16,0,Currency.INVALID);
      
      private const newString:String = "MysteryBoxSelectEntry.newString";
      
      private const onSaleString:String = "MysteryBoxSelectEntry.onSaleString";
      
      private const saleEndString:String = "MysteryBoxSelectEntry.saleEndString";
      
      public var _K_n:MysteryBoxInfo;
      
      private var _H_A_:DisplayObject;
      
      private var _dx:_1dh;
      
      private var _3s:DisplayObject;
      
      private var _1fz:SimpleText;
      
      private var _1X_K_:SimpleText;
      
      private var _1w0:Boolean = false;
      
      private var _1zh:Boolean = false;
      
      private var _1aL_:DisplayObject;
      
      public function MysteryBoxSelectEntry(param1:MysteryBoxInfo)
      {
         var _loc2_:DisplayObject = null;
         super();
         this._1aL_ = new _0X_q();
         this._1aL_.y = -5;
         this._1aL_.width = MysteryBoxSelectModal._q9 - 5;
         this._1aL_.height = MysteryBoxSelectModal._0D_0 - 8;
         addChild(this._1aL_);
         _loc2_ = new _0X_q();
         _loc2_.y = 0;
         _loc2_.width = MysteryBoxSelectModal._q9 - 5;
         _loc2_.height = MysteryBoxSelectModal._0D_0 - 8 + 5;
         _loc2_.alpha = 0;
         addChild(_loc2_);
         this._K_n = param1;
         var _loc3_:SimpleText = this._1g8(this._K_n.title,74,18,20,true);
         addChild(_loc3_);
         this._Z_J_();
         this._tm();
         if(this._K_n._0tF_())
         {
            this.buyButton.setPrice(this._K_n._0__l,this._K_n._G_5);
         }
         else
         {
            this.buyButton.setPrice(this._K_n._1P_G_,this._K_n._0Z_E_);
         }
         this.buyButton.x = MysteryBoxSelectModal._q9 - 100;
         this.buyButton.y = 16;
         this.buyButton._1Y_4 = 70;
         this.buyButton.addEventListener(MouseEvent.CLICK,this._00u);
         addChild(this.buyButton);
         this._H_A_ = this._K_n._H_A_;
         this._3s = this._K_n._3s;
         if(this._H_A_ == null)
         {
            this._K_n.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._1K_7);
         }
         else
         {
            this._1D_Z_();
         }
         if(this._3s == null)
         {
            this._K_n._P_6.contentLoaderInfo.addEventListener(Event.COMPLETE,this._13D_);
         }
         else
         {
            this._08P_();
         }
         addEventListener(MouseEvent.ROLL_OVER,this._1E_W_);
         addEventListener(MouseEvent.ROLL_OUT,this._A_3);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function _1E_W_(param1:MouseEvent) : void
      {
         this._1w0 = true;
         this._08P_();
      }
      
      private function _A_3(param1:MouseEvent) : void
      {
         this._1w0 = false;
         this._0uR_();
      }
      
      private function _Z_J_() : void
      {
         if(this._K_n.isNew())
         {
            this._1fz = this._1g8(this.newString,74,0).setColor(16768512);
            addChild(this._1fz);
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Number = 1.05 + 0.05 * Math.sin(getTimer() / 200);
         if(this._1fz)
         {
            this._1fz.scaleX = _loc2_;
            this._1fz.scaleY = _loc2_;
         }
         if(this._1X_K_)
         {
            this._1X_K_.scaleX = _loc2_;
            this._1X_K_.scaleY = _loc2_;
         }
      }
      
      private function _tm() : void
      {
         var _loc1_:_dU_ = null;
         var _loc2_:SimpleText = null;
         if(this._K_n._0tF_())
         {
            this._1X_K_ = this._1g8(this.onSaleString,int(320 * MysteryBoxSelectModal._q9 / 415),0).setColor(65280);
            addChild(this._1X_K_);
            _loc1_ = this._K_n._0gy();
            _loc2_ = this._1g8("",int(250 * MysteryBoxSelectModal._q9 / 415) - 32,46).setColor(16711680);
            _loc2_.setStringBuilder(_loc1_);
            addChild(_loc2_);
         }
      }
      
      private function _1K_7(param1:Event) : void
      {
         this._K_n.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._1K_7);
         this._H_A_ = DisplayObject(this._K_n.loader);
         this._1D_Z_();
      }
      
      private function _13D_(param1:Event) : void
      {
         this._K_n._P_6.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._13D_);
         this._3s = DisplayObject(this._K_n._P_6);
         this._08P_();
      }
      
      public function _1g8(param1:String, param2:int, param3:int, param4:int = 12, param5:Boolean = false) : SimpleText
      {
         var _loc6_:SimpleText = null;
         _loc6_ = new SimpleText().setSize(param4).setColor(16777215).setTextWidth(MysteryBoxSelectModal._q9 - 185);
         _loc6_.setBold(true);
         if(param5)
         {
            _loc6_.setStringBuilder(new SText(param1));
         }
         else
         {
            _loc6_.setStringBuilder(new _dU_().setParams(param1));
         }
         _loc6_.setWordWrap(true);
         _loc6_.setMultiLine(true);
         _loc6_.setAutoSize(TextFieldAutoSize.LEFT);
         _loc6_.setHorizontalAlign(TextFormatAlign.LEFT);
         _loc6_.filters = [new DropShadowFilter(0,0,0)];
         _loc6_.x = param2;
         _loc6_.y = param3;
         return _loc6_;
      }
      
      private function _1D_Z_() : void
      {
         if(this._H_A_ == null)
         {
            return;
         }
         this._H_A_.width = 48;
         this._H_A_.height = 48;
         this._H_A_.x = 14;
         this._H_A_.y = 6;
         addChild(this._H_A_);
      }
      
      private function _08P_() : void
      {
         var _loc1_:Array = null;
         var _loc2_:ColorMatrixFilter = null;
         if(this._3s == null)
         {
            return;
         }
         var _loc3_:int = 8;
         this._3s.width = 291 - _loc3_;
         this._3s.height = 598 - _loc3_ * 2 - 2;
         var _loc4_:Point = this.globalToLocal(new Point(MysteryBoxSelectModal._1gM_() + 1 + 14,2 + _loc3_ + 300 - WebMain.sHeight / 2));
         this._3s.x = _loc4_.x * ((379.25 - _loc4_.x) * 2 + 800) / 800;
         this._3s.y = _loc4_.y;
         if(this._1w0 && !this._1zh)
         {
            this._1zh = true;
            addChild(this._3s);
            this._dx = new _1dh();
            this._dx.draw(this._3s.width,this._3s.height + 2,_1dh._1b7);
            this._dx.x = this._3s.x;
            this._dx.y = this._3s.y;
            this._3s.y = this._3s.y + 2;
            addChild(this._dx);
            _loc1_ = [3.0742,-1.8282,-0.246,0,50,-0.9258,2.1718,-0.246,0,50,-0.9258,-1.8282,3.754,0,50,0,0,0,1,0];
            _loc2_ = new ColorMatrixFilter(_loc1_);
            this._1aL_.filters = [_loc2_];
         }
      }
      
      private function _0uR_() : void
      {
         if(this._1zh)
         {
            removeChild(this._dx);
            removeChild(this._3s);
            this._1zh = false;
            this._1aL_.filters = [];
         }
      }
      
      private function _00u(param1:MouseEvent) : void
      {
         var _loc2_:DialogSignal = GameContext.getInjector().getInstance(DialogSignal);
         var _loc3_:MysteryBoxRollModal = new MysteryBoxRollModal(this._K_n);
         _loc3_._jI_ = MysteryBoxSelectModal(parent.parent);
         _loc2_.dispatch(_loc3_);
      }
   }
}
