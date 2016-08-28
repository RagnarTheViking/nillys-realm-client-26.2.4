package _1__H_
{
   import _17B_._1dh;
   import _1gF_.SimpleText;
   import _17B_._0P_T_;
   import _17B_.PetFeeder;
   import _17B_.XImageButton;
   import _17B_.PetAbilityMeter;
   import com.company.assembleegameclient.ui._0fL_;
   import _f7.Signal;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.events.Event;
   import _1F_z._1Z_D_;
   import _1F_z._1r__;
   import _0xn._14N_;
   import _1F_z._gC_;
   import _0xn._bf;
   import _05g._1S_m;
   import _0xn._1uk;
   
   public class _1O_8 extends _M_t
   {
       
      
      private const background:_1dh = _1uk._0P_d(_bf._0Y_O_,_bf._L_v);
      
      private const _W_H_:SimpleText = _1uk._01t(11776947,18,true);
      
      private const _fK_:_0P_T_ = _1uk._0N_s(_1O_I_._1aQ_,_bf._L_v - 35);
      
      private const _1I_O_:PetFeeder = _1uk._120();
      
      private const _1D_r:XImageButton = _1uk._V_w(_bf._0Y_O_);
      
      private const _0ou:Vector.<PetAbilityMeter> = _1uk._0R_k();
      
      private const _06h:Vector.<Boolean> = Vector.<Boolean>([false,false,false]);
      
      private const _lN_:_0fL_ = new _0fL_(_bf._0Y_O_ - 25,0);
      
      public const _0__W_:Signal = new Signal();
      
      public const closed:Signal = new Signal();
      
      public var _I_G_:Signal;
      
      public var _0T_P_:Signal;
      
      public function _1O_8()
      {
         super();
      }
      
      public function init() : void
      {
         this._W_H_.setStringBuilder(new _dU_().setParams(_1O_I_._M_G_));
         this._1I_O_._0__W_.addOnce(this._19);
         this._I_G_ = this._fK_._03H_;
         this._0T_P_ = this._fK_._1eI_;
         this._1D_r.clicked.add(this._qN_);
         this._1I_O_._084.add(this._0J_P_);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._0J_k();
         this._0sF_();
         this._1fU_();
      }
      
      public function _kC_() : void
      {
         this._1I_O_._0L_c();
         this._1I_O_._1lm();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this._1I_O_._084.remove(this._0J_P_);
         this._1D_r.clicked.remove(this._qN_);
      }
      
      private function _0J_P_(param1:Boolean, param2:_1Z_D_) : void
      {
         var _loc3_:_1r__ = null;
         this._fK_._1X_u(!param1);
         if(param2)
         {
            if(!param2._0bZ_())
            {
               this._fK_.setPrefix(_1O_I_._1aQ_);
               _loc3_ = _1r__._0Q_J_(param2._1b8());
               this._fK_._1qI_(_14N_._do_(_loc3_));
               this._fK_._N_e(_14N_._0D_q(_loc3_));
            }
            else
            {
               this._fK_._0M_H_();
               this._fK_.setPrefix(_1O_I_._A_k);
            }
         }
         else
         {
            this._fK_.setPrefix(_1O_I_._1N_T_);
         }
      }
      
      private function _qN_() : void
      {
         this.closed.dispatch();
      }
      
      private function _19() : void
      {
         this._0__W_.dispatch();
      }
      
      public function destroy() : void
      {
         var _loc1_:PetAbilityMeter = null;
         for each(_loc1_ in this._0ou)
         {
            _loc1_._I_B_.remove(this._i4);
         }
         this._fK_._1ja.remove(this._F_P_);
      }
      
      public function _1Q_5(param1:Array, param2:int) : void
      {
         var _loc3_:_gC_ = null;
         var _loc4_:PetAbilityMeter = null;
         var _loc5_:PetAbilityMeter = null;
         var _loc6_:int = 0;
         if(param1 == null)
         {
            for each(_loc4_ in this._0ou)
            {
               _loc4_.visible = false;
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc6_ < this._0ou.length)
            {
               _loc5_ = this._0ou[_loc6_];
               _loc5_.index = _loc6_;
               _loc5_.max = param2;
               _loc5_.visible = true;
               _loc5_._0C_l(_loc3_);
               _loc5_._I_B_.add(this._i4);
               _loc6_++;
            }
         }
      }
      
      private function _i4(param1:PetAbilityMeter, param2:Boolean) : void
      {
         this._06h[param1.index] = param2;
         var _loc3_:Boolean = this._1cd();
         this._fK_._1X_u(_loc3_);
         this._1I_O_._0bC_(_loc3_);
         !_loc3_ && this._1I_O_._0L_c();
      }
      
      private function _1cd() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         for each(_loc1_ in this._06h)
         {
            if(_loc1_)
            {
               _loc2_ = true;
               break;
            }
         }
         return _loc2_;
      }
      
      private function _0sF_() : void
      {
         var _loc1_:PetAbilityMeter = null;
         addChild(this.background);
         addChild(this._W_H_);
         addChild(this._fK_);
         addChild(this._1I_O_);
         addChild(this._1D_r);
         addChild(this._lN_);
         for each(_loc1_ in this._0ou)
         {
            _loc1_.visible = false;
            addChild(_loc1_);
         }
      }
      
      private function _1fU_() : void
      {
         _9s();
         this._1yv();
         this._0sq();
      }
      
      private function _0sq() : void
      {
         this._1I_O_.x = Math.round((_bf._0Y_O_ - this._1I_O_.width) * 0.5);
      }
      
      private function _0J_k() : void
      {
         var _loc1_:PetAbilityMeter = null;
         this._W_H_.textChanged.addOnce(this._D_q);
         var _loc2_:_1S_m = new _1S_m();
         for each(_loc1_ in this._0ou)
         {
            _loc2_.push(_loc1_._1ja);
         }
         _loc2_.complete.addOnce(this._1n__);
         this._fK_._1ja.add(this._F_P_);
      }
      
      private function _D_q() : void
      {
         this._W_H_.y = 5;
         this._W_H_.x = (_bf._0Y_O_ - this._W_H_.width) * 0.5;
      }
      
      private function _1n__() : void
      {
         var _loc1_:PetAbilityMeter = null;
         var _loc2_:int = 0;
         _loc2_ = this._lN_.y + 14;
         for each(_loc1_ in this._0ou)
         {
            _loc1_.x = (_bf._0Y_O_ - 227) * 0.5;
            _loc1_.y = _loc2_;
            _loc2_ = _loc2_ + (_loc1_.height + 10);
         }
      }
      
      private function _1yv() : void
      {
         this._lN_.x = (_bf._0Y_O_ - this._lN_.width + 8) * 0.5;
         this._lN_.y = 152;
      }
      
      private function _F_P_() : void
      {
         this._fK_.x = (_bf._0Y_O_ - this._fK_.width) / 2;
      }
   }
}
