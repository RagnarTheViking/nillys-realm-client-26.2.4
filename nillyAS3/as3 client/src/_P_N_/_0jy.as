package _P_N_
{
   import flash.display.Sprite;
   import _17B_._1dh;
   import _1gF_.SimpleText;
   import flash.display.DisplayObject;
   import com.company.assembleegameclient.ui.Button;
   import _f7.Signal;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import _C_._1O_I_;
   import _05g._1S_m;
   import _0xn._1uk;
   
   public class _0jy extends Sprite
   {
       
      
      private var _1lB_:Class;
      
      private const background:_1dh = _1uk._0aY_(289,279);
      
      private const _W_H_:SimpleText = _1uk._0M_n(16777215,18,true);
      
      private const _5C_:SimpleText = _1uk._0M_n(16777103,16,true);
      
      private const _1A___:DisplayObject = new _1lB_();
      
      private const _0pR_:Button = new Button(16,"Pets.sendToYard",120);
      
      public const closed:Signal = new Signal();
      
      var skinType:int;
      
      private var _07P_:Bitmap;
      
      private var petName:String;
      
      public function _0jy(param1:String, param2:int)
      {
         this._1lB_ = _W_B_;
         super();
         this.petName = param1;
         this.skinType = param2;
         this._0pR_.addEventListener(MouseEvent.MOUSE_DOWN,this._1z0);
      }
      
      private function _1z0(param1:MouseEvent) : void
      {
         this.closed.dispatch();
      }
      
      public function init(param1:Bitmap) : void
      {
         this._07P_ = param1;
         this._t1();
         this._0J_k();
         this._0sF_();
         this._1fU_();
      }
      
      private function _t1() : void
      {
         this._W_H_.setStringBuilder(new _dU_().setParams(_1O_I_._1G_h));
         this._5C_.setStringBuilder(new _dU_().setParams(this.petName));
      }
      
      private function _qN_() : void
      {
         this.closed.dispatch();
      }
      
      private function _0sF_() : void
      {
         this._1A___.y = 31;
         addChild(this.background);
         addChild(this._W_H_);
         addChild(this._5C_);
         addChild(this._1A___);
         addChild(this._0pR_);
         addChild(this._07P_);
      }
      
      private function _1fU_() : void
      {
         this._9s();
         this._07P_.x = (287 - this._07P_.width) * 0.5;
         this._1A___.x = 1;
         this._1A___.y = 32;
         this._07P_.x = this._07P_.x - 5;
         this._07P_.y = 41;
      }
      
      private function _9s() : void
      {
         stage;
         this.x = (800 - this.width) * 0.5;
         stage;
         this.y = (600 - this.height) * 0.5;
      }
      
      private function _0J_k() : void
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.push(this._W_H_.textChanged);
         _loc1_.push(this._5C_.textChanged);
         _loc1_.complete.addOnce(this._D_q);
         this._0pR_.textChanged.add(this._F_P_);
      }
      
      private function _F_P_() : void
      {
         this._0pR_.x = (287 - this._0pR_.width) * 0.5;
         this._0pR_.y = 240;
      }
      
      private function _D_q() : void
      {
         this._W_H_.x = (287 - this._W_H_.width) * 0.5;
         this._W_H_.y = 23;
         this._5C_.x = (287 - this._5C_.width) * 0.5;
         this._5C_.y = 230;
      }
   }
}
