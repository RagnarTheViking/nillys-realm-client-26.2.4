package _12p
{
   import flash.display.Sprite;
   import _17B_._1dh;
   import _17B_.XImageButton;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import _D_2.MysteryBoxInfo;
   import flash.display.DisplayObject;
   import _0xn._1uk;
   import flash.events.Event;
   import _0H_6.GameContext;
   import _wi.Injector;
   import _xr._0P_R_;
   
   public class MysteryBoxSelectModal extends Sprite
   {
      
      public static const _1Y_6:int = 20;
      
      public static var _q9:int;
      
      public static var _P_m:int;
      
      public static var _0D_0:int;
      
      public static var open:Boolean;
      
      public static var _1bx:Class = _0Y_m;
       
      
      private var btn:XImageButton;
      
      private var box_:Sprite;
      
      private var _1L_j:Object;
      
      private var titleString:String = "MysteryBoxSelectModal.titleString";
      
      public function MysteryBoxSelectModal()
      {
         this.box_ = new Sprite();
         super();
         _q9 = 385;
         _P_m = 60;
         _0D_0 = 77;
         var _loc1_:Injector = GameContext.getInjector();
         var _loc2_:_0P_R_ = _loc1_.getInstance(_0P_R_);
         this._1L_j = _loc2_._U_A_();
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         addChild(this.box_);
         this._e6();
         this._C_h();
         open = true;
      }
      
      public static function _1gM_() : int
      {
         return 300 + _q9 / 2;
      }
      
      private static function makeModalBackground(param1:int, param2:int) : _1dh
      {
         var _loc3_:_1dh = new _1dh();
         _loc3_.draw(param1,param2,_1dh._1rP_);
         return _loc3_;
      }
      
      public function _1g8(param1:String, param2:int, param3:int) : SimpleText
      {
         var _loc4_:SimpleText = null;
         _loc4_ = new SimpleText().setSize(16).setColor(16777215).setTextWidth(_q9 - _1Y_6 * 2);
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
         this.box_.x = 600 / 2 - _q9 / 2;
         WebMain.stage_;
         this.box_.y = 600 / 2 - _P_m / 2;
      }
      
      private function _e6() : void
      {
         var _loc1_:MysteryBoxInfo = null;
         var _loc2_:DisplayObject = null;
         var _loc3_:int = 0;
         var _loc4_:MysteryBoxSelectEntry = null;
         var _loc6_:Number = NaN;
         for each(_loc1_ in this._1L_j)
         {
            _P_m = _P_m + _0D_0;
         }
         _loc2_ = new _1bx();
         _loc2_.width = _q9 + 1;
         _loc2_.height = _P_m - 25;
         _loc2_.y = 27;
         _loc2_.alpha = 0.95;
         this.box_.addChild(_loc2_);
         this.box_.addChild(makeModalBackground(_q9,_P_m));
         this.btn = _1uk._V_w(_q9);
         this.box_.addChild(this.btn);
         this.box_.addChild(this._1g8(this.titleString,_1Y_6,6).setSize(18));
         var _loc5_:Number = 20;
         _loc6_ = 50;
         _loc3_ = 0;
         for each(_loc1_ in this._1L_j)
         {
            if(_loc3_ == 6)
            {
               break;
            }
            _loc4_ = new MysteryBoxSelectEntry(_loc1_);
            _loc4_.x = x + _loc5_;
            _loc4_.y = y + _loc6_;
            _loc6_ = _loc6_ + _0D_0;
            this.box_.addChild(_loc4_);
            _loc3_++;
         }
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         open = false;
      }
   }
}
