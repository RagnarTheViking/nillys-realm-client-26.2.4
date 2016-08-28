package _0C_j
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import _f7.Signal;
   import flash.events.Event;
   import _1xa._dU_;
   import flash.text.TextFormatAlign;
   import _C_._1O_I_;
   import _00v._G_D_;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   
   public class _ze extends Sprite
   {
      
      private static const _0Y_L_:int = 8;
      
      private static const _0M_b:int = 120;
      
      private static const _0K_t:int = 16;
      
      private static const _M_k:int = 546;
      
      private static const _W_T_:int = 416;
      
      private static const _N_3:int = 368;
      
      private static const _rp:int = 164;
      
      private static const _54:int = 210;
       
      
      private const background:DisplayObject = _1L_c();
      
      private const title:SimpleText = _1lN_();
      
      private const _25:SimpleText = _088();
      
      private const _08A_:SimpleText = _aJ_();
      
      private const close:Button = _C_r();
      
      public const closed:Signal = new NativeMappedSignal(close,MouseEvent.CLICK);
      
      public function _ze()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         stage;
         x = (800 - width) / 2;
         stage;
         y = (600 - height) / 2;
      }
      
      public function setTitle(param1:String) : _ze
      {
         this.title.setStringBuilder(new _dU_().setParams(param1));
         return this;
      }
      
      public function setBody(param1:String, param2:String) : _ze
      {
         this._25.setStringBuilder(new _dU_().setParams(param1));
         this._08A_.setStringBuilder(new _dU_().setParams(param2));
         return this;
      }
      
      private function _1L_c() : DisplayObject
      {
         var _loc1_:_11Z_ = new _11Z_();
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lN_() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(18).setColor(11974326).setTextWidth(_M_k).setAutoSize(TextFormatAlign.CENTER).setBold(true);
         _loc1_.y = _0Y_L_;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _088() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(14).setColor(14864077).setTextWidth(_W_T_).setAutoSize(TextFormatAlign.CENTER).setBold(true);
         _loc1_.x = (_M_k - _W_T_) * 0.5;
         _loc1_.y = _rp;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _aJ_() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(14).setColor(10914439).setTextWidth(_W_T_).setAutoSize(TextFormatAlign.CENTER);
         _loc1_.x = (_M_k - _W_T_) * 0.5;
         _loc1_.y = _54;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _C_r() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button(_0K_t,_1O_I_.CLOSE,_0M_b);
         _loc1_.textChanged.addOnce(this._lj);
         _loc1_.y = _N_3;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _lj() : void
      {
         new _G_D_().layout(_M_k,this.close);
      }
   }
}
