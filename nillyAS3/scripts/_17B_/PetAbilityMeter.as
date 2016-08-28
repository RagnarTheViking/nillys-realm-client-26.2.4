package _17B_
{
   import flash.display.Sprite;
   import _1R_o._Y_5;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _1R_o._0xf;
   import flash.events.Event;
   import _1F_z._gC_;
   import _0xn._1S_i;
   import _1xa._dU_;
   import _C_._1O_I_;
   import _0xn._bf;
   import flash.filters.DropShadowFilter;
   import _05g._1S_m;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import _0xn._1uk;
   
   public class PetAbilityMeter extends Sprite implements _Y_5
   {
       
      
      public const _I_B_:Signal = new Signal(PetAbilityMeter,Boolean);
      
      private const _1L_G_:SimpleText = _1uk._01t(11776947,14,true,true);
      
      private const _R_D_:SimpleText = _1uk._01t(11776947,14,true,true);
      
      private const _1G_v:_17B_._dh = new _17B_._dh(_bf._0rw,_bf._136);
      
      private var _0T_o:Boolean = true;
      
      private var _0wn:int = 0;
      
      private var _16V_:int = 0;
      
      private var _1__q:Number = 0;
      
      public var _1ja:Signal;
      
      public var max:int;
      
      public var index:int;
      
      private var _0pC_:_0xf;
      
      public function PetAbilityMeter()
      {
         this._1ja = new Signal();
         this._0pC_ = new _0xf();
         super();
         this._1G_v._I_B_.add(this._09Q_);
         this._0J_k();
         this._0sF_();
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._0pC_._bD_(this);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this._1G_v._I_B_.remove(this._09Q_);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function _0C_l(param1:_gC_) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this._0wn = param1.points;
         this._16V_ = param1.level;
         this._1X_H_(param1.name);
         this.setUnlocked(param1._19q());
         this._O_O_(!!this._0T_o?int(param1.level):0);
         this._09Q_(false);
         this._0pC_.tooltip = new _0im(param1);
         if(this._0T_o)
         {
            _loc2_ = Math.max(0,_1S_i._1eA_(param1.points,param1.level));
            _loc3_ = _1S_i._1l4(param1.level);
            _loc2_ = param1.level >= this.max?int(_loc3_):int(_loc2_);
            this._1K_y(_loc2_,_loc3_);
         }
         param1._aL_.add(this._O_k);
      }
      
      private function _O_k(param1:_gC_) : void
      {
         var _loc2_:Number = NaN;
         this.setUnlocked(param1._19q());
         if(param1.points > this._0wn && this._0T_o)
         {
            this._0wn = param1.points;
            this._1__q = _1S_i._1eA_(param1.points,this._16V_);
            _loc2_ = _1S_i._1l4(this._16V_);
            if(_loc2_ != 0 && this._1__q > _loc2_)
            {
               this._1__q = this._1__q - _loc2_;
               this._1G_v._zC_.add(this._1pC_);
               this._1G_v.fill();
               this._09Q_(true);
            }
            else
            {
               this._1K_y(this._1__q,_loc2_);
            }
         }
      }
      
      private function _1pC_() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Boolean = false;
         if(!_loc2_)
         {
            this._16V_++;
            this._O_O_(this._16V_,true);
            _loc1_ = _1S_i._1l4(this._16V_);
            if(this._1__q > _loc1_)
            {
               this._1G_v.reset();
               this._1__q = this._1__q - _loc1_;
               this._1G_v.fill();
            }
            else
            {
               this._1G_v._zC_.remove(this._1pC_);
               if(this._16V_ >= this.max)
               {
                  this._1G_v._1P_3(null);
                  this._1__q = 0;
               }
               else
               {
                  this._1G_v.reset();
                  this._1K_y(this._1__q,_loc1_);
               }
            }
         }
      }
      
      public function _1X_H_(param1:String) : void
      {
         this._R_D_.setStringBuilder(new _dU_().setParams(param1));
      }
      
      public function _O_O_(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:String = param1 >= this.max?_1O_I_._0q4:_1O_I_._4U_;
         this._1L_G_.setColor(!!param2?uint(1572859):param1 >= this.max?uint(_bf._1q5):uint(11776947));
         this._1L_G_.setStringBuilder(new _dU_().setParams(_loc3_,{"level":param1.toString()}));
         this._1L_G_.textChanged.addOnce(this._0V_Q_);
      }
      
      public function _1K_y(param1:int, param2:int) : void
      {
         this._1G_v._1X_z(param2);
         this._1G_v._0W_I_(param1);
      }
      
      public function setUnlocked(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         if(this._0T_o != param1)
         {
            this._0T_o = param1;
            _loc2_ = !!param1?11776947:5658198;
            _loc3_ = !!param1?[new DropShadowFilter(0,0,0)]:[];
            this._R_D_.setColor(_loc2_);
            this._R_D_.filters = _loc3_;
            this._1L_G_.visible = param1;
         }
      }
      
      private function _0sF_() : void
      {
         addChild(this._R_D_);
         addChild(this._1L_G_);
         addChild(this._1G_v);
      }
      
      private function _0J_k() : void
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.push(this._1L_G_.textChanged);
         _loc1_.push(this._R_D_.textChanged);
         _loc1_.complete.addOnce(this._D_q);
      }
      
      private function _0V_Q_() : void
      {
         this._1G_v.y = 21;
         this._1L_G_.x = _bf._0rw - this._1L_G_.width;
      }
      
      private function _D_q() : void
      {
         this._0V_Q_();
         this._1ja.dispatch();
      }
      
      private function _09Q_(param1:Boolean) : void
      {
         this._1L_G_.setColor(!!param1?uint(1572859):this._16V_ >= this.max?uint(_bf._1q5):uint(11776947));
         this._R_D_.setColor(!!param1?uint(1572859):this._16V_ >= 100?uint(_bf._1q5):uint(11776947));
         if(!param1 && this._16V_ >= 100)
         {
            this._1G_v._P_n(_bf._1q5);
         }
         this._I_B_.dispatch(this,param1);
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this._0pC_._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this._0pC_._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._0pC_._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this._0pC_._fn();
      }
   }
}
