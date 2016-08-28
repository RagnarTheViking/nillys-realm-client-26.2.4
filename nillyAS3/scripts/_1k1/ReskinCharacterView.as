package _1k1
{
   import flash.display.Sprite;
   import _A_4._zp;
   import _05g._1S_m;
   import _T_n._03K_;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import _f7.Signal;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.display.DisplayObject;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import _00v._G_D_;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   
   public class ReskinCharacterView extends Sprite
   {
      
      private static const _1n4:int = 10;
      
      private static const _M_k:int = _zp.WIDTH + _1n4 * 2;
      
      private static const _0M_b:int = 120;
      
      private static const _0K_t:int = 16;
      
      private static const _4X_:int = 40;
      
      private static const _ik:int = 27;
       
      
      private const _0kQ_:_1S_m = this._1Y_p();
      
      private const background:_03K_ = this._1L_c();
      
      private const title:SimpleText = this._1lN_();
      
      private const list:_zp = this._1lZ_();
      
      private const cancel:Button = this._1E_s();
      
      private const select:Button = this._X_v();
      
      public const _1J_l:Signal = new NativeMappedSignal(this.cancel,MouseEvent.CLICK);
      
      public const selected:Signal = new NativeMappedSignal(this.select,MouseEvent.CLICK);
      
      public var _1F_h:int;
      
      public function ReskinCharacterView()
      {
         super();
      }
      
      private function _1Y_p() : _1S_m
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.complete.add(this._F_W_);
         return _loc1_;
      }
      
      private function _1L_c() : _03K_
      {
         var _loc1_:_03K_ = new _03K_();
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lN_() : SimpleText
      {
         var _loc1_:SimpleText = new SimpleText().setSize(18).setColor(11974326).setTextWidth(_M_k);
         _loc1_.setAutoSize(TextFieldAutoSize.CENTER).setBold(true);
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._1f8));
         _loc1_.y = _1n4 * 0.5;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lZ_() : _zp
      {
         var _loc1_:_zp = null;
         _loc1_ = new _zp();
         _loc1_.x = _1n4;
         _loc1_.y = _1n4 + _ik;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1E_s() : Button
      {
         var _loc1_:Button = new Button(_0K_t,_1O_I_._0tE_,_0M_b);
         addChild(_loc1_);
         this._0kQ_.push(_loc1_.textChanged);
         return _loc1_;
      }
      
      private function _X_v() : Button
      {
         var _loc1_:Button = new Button(_0K_t,_1O_I_._1uX_,_0M_b);
         addChild(_loc1_);
         this._0kQ_.push(_loc1_.textChanged);
         return _loc1_;
      }
      
      public function _0S_K_(param1:Vector.<DisplayObject>) : void
      {
         this.list.setItems(param1);
         this._17z();
         this._0P_j();
         this._F_W_();
      }
      
      private function _17z() : void
      {
         this._1F_h = Math.min(_zp.HEIGHT + _1n4,this.list._sz());
         this._1F_h = this._1F_h + (_4X_ + _1n4 * 2 + _ik);
      }
      
      private function _0P_j() : void
      {
         this.background.draw(_M_k,this._1F_h);
         this.background.graphics.lineStyle(2,5987163,1,false,LineScaleMode.NONE,CapsStyle.NONE,JointStyle.BEVEL);
         this.background.graphics.moveTo(1,_ik);
         this.background.graphics.lineTo(_M_k - 1,_ik);
      }
      
      private function _F_W_() : void
      {
         var _loc1_:_G_D_ = new _G_D_();
         _loc1_.layout(_M_k,this.cancel,this.select);
         this.cancel.y = this.select.y = this._1F_h - _4X_;
      }
   }
}
