package _0J_8
{
   import flash.display.Sprite;
   import _C_._1O_I_;
   import _f7.Signal;
   import com.company.assembleegameclient.util.offer.Offers;
   import _1V_8._jw;
   import Frames.Frame;
   import Frames._00x;
   import Frames._1U_L_;
   import com.company.assembleegameclient.ui.Button;
   import com.company.assembleegameclient.ui._03S_;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.util._0lH_;
   import flash.display.Shape;
   import flash.text.TextFieldAutoSize;
   import com.company.assembleegameclient.util.offer.Offer;
   
   public class MoneyFrame extends Sprite
   {
      
      private static const TITLE:String = _1O_I_._mY_;
      
      private static const _0yE_:String = "/money";
      
      private static const _0H_b:String = _1O_I_._1R_x;
      
      private static const _10U_:String = _1O_I_._0y1;
      
      private static const _vl:String = _1O_I_._1N_Z_;
      
      private static const WIDTH:int = 550;
       
      
      public var buyNow:Signal;
      
      public var cancel:Signal;
      
      private var _M_2:Offers;
      
      private var config:_jw;
      
      private var _0jF_:Frame;
      
      private var _01P_:_00x;
      
      private var _0V_y:_1U_L_;
      
      public var _W_g:Button;
      
      public var _1X_k:_03S_;
      
      public function MoneyFrame()
      {
         super();
         this.buyNow = new Signal(Offer,String);
         this.cancel = new Signal();
      }
      
      public function initialize(param1:Offers, param2:_jw) : void
      {
         this._M_2 = param1;
         this.config = param2;
         this._0jF_ = new Frame(TITLE,"","",_0yE_,WIDTH);
         param2._0ev() && this._6E_();
         this._15p();
         this._K_x();
         addChild(this._0jF_);
         this._1sn(_1O_I_._fC_);
         this._1X_k.addEventListener(MouseEvent.CLICK,this.onCancel);
      }
      
      public function _6E_() : void
      {
         this._1O_m();
         this._0jF_._15Z_(_0H_b);
         this._0jF_._N_d(this._01P_);
         this._0jF_._F_X_(14);
         this._1wt(8355711,536,2,10);
         this._0jF_._F_X_(6);
      }
      
      private function _1O_m() : void
      {
         var _loc1_:Vector.<String> = this._0yg();
         this._01P_ = new _00x(_loc1_);
         this._01P_.setSelected(Parameters.data_.paymentMethod);
      }
      
      private function _0yg() : Vector.<String>
      {
         var _loc1_:_0lH_ = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         for each(_loc1_ in _0lH_._096)
         {
            _loc2_.push(_loc1_.label_);
         }
         return _loc2_;
      }
      
      private function _1wt(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Shape = new Shape();
         _loc5_.graphics.beginFill(param1);
         _loc5_.graphics.drawRect(param4,0,param2 - param4 * 2,param3);
         _loc5_.graphics.endFill();
         this._0jF_._N_2(_loc5_,0);
      }
      
      private function _15p() : void
      {
         this._0V_y = new _1U_L_(this._M_2,this.config);
         this._0V_y._f2(this.config._f2());
         this._0jF_._15Z_(_10U_);
         this._0jF_._N_2(this._0V_y);
      }
      
      public function _K_x() : void
      {
         this._W_g = new Button(16,_vl);
         this._W_g.addEventListener(MouseEvent.CLICK,this._H_y);
         this._W_g.x = 8;
         this._W_g.y = this._0jF_.h_ - 52;
         this._0jF_.addChild(this._W_g);
      }
      
      public function _1sn(param1:String) : void
      {
         this._1X_k = new _03S_(18,true,param1);
         if(param1 != "")
         {
            this._1X_k.buttonMode = true;
            this._1X_k.x = 800 / 2 + this._0jF_.w_ / 2 - this._1X_k.width - 26;
            this._1X_k.y = 600 / 2 + this._0jF_.h_ / 2 - 52;
            this._1X_k.setAutoSize(TextFieldAutoSize.RIGHT);
            addChild(this._1X_k);
         }
      }
      
      protected function _H_y(param1:MouseEvent) : void
      {
         this.disable();
         var _loc2_:Offer = this._0V_y._s2().offer;
         var _loc3_:String = !!this._01P_?this._01P_._1H_j():null;
         this.buyNow.dispatch(_loc2_,_loc3_ || "");
      }
      
      public function disable() : void
      {
         this._0jF_.disable();
         this._1X_k._1xQ_(11776947);
         this._1X_k.mouseEnabled = false;
         this._1X_k.mouseChildren = false;
      }
      
      public function _T_j() : void
      {
         this._1X_k._2__5();
         this._1X_k.mouseEnabled = true;
         this._1X_k.mouseChildren = true;
      }
      
      protected function onCancel(param1:MouseEvent) : void
      {
         stage.focus = stage;
         this.cancel.dispatch();
      }
   }
}
