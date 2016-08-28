package _17B_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _4Z_._1T_i;
   import _4Z_._6z;
   import _1F_z._07p;
   import _1F_z._1Z_D_;
   import _0xn._1uk;
   
   public class PetFeeder extends Sprite
   {
       
      
      public const _0__W_:Signal = new Signal();
      
      public const _084:Signal = new Signal(Boolean,_1Z_D_);
      
      public const _1vc:Signal = new Signal(_1Z_D_);
      
      private var _1V_A_:_1T_i;
      
      private var _O_r:_17B_._0rX_;
      
      private var _0V_2:_6z;
      
      private var state:_07p;
      
      public function PetFeeder()
      {
         this._1V_A_ = new _1T_i();
         this._O_r = _1uk._1U_a();
         this._0V_2 = _1uk._0O_Z_();
         super();
         addChild(this._1V_A_);
         addChild(this._O_r);
         addChild(this._0V_2);
         this._1V_A_._0__W_.addOnce(this._19);
         this._0V_2._032.add(this._B_l);
         this._0V_2._1V_Y_.add(this._D_J_);
      }
      
      public function initialize(param1:_07p) : void
      {
         this.state = param1;
         this._G_4(this.state._05k);
         this.update();
      }
      
      public function _G_4(param1:_1Z_D_) : void
      {
         this._1V_A_._G_4(param1);
         if(param1)
         {
            this._1vc.dispatch(param1);
         }
      }
      
      public function _0L_c() : void
      {
         this.state._0hj = -1;
         this.state._1sB_ = -1;
         this.state._0E_K_ = -1;
         this._0V_2._1E_u();
         this.update();
      }
      
      private function _D_J_() : void
      {
         this.state._0hj = -1;
         this.state._1sB_ = -1;
         this.state._0E_K_ = -1;
         this.update();
      }
      
      private function _B_l(param1:int) : void
      {
         this.state._0hj = param1;
         this.update();
      }
      
      private function update() : void
      {
         this._1lm();
         this._084.dispatch(this.state._0V_6(),this.state._05k);
      }
      
      private function _19() : void
      {
         this._0__W_.dispatch();
      }
      
      public function _1lm() : void
      {
         if(this.state._0V_6())
         {
            this._O_r._0vi(true);
            this._0V_2._0vi(true);
            this._1V_A_._0vi(true);
         }
         else
         {
            this._0V_2._0vi(this.state._0hj == -1);
            this._1V_A_._0vi(this.state._05k == null);
            this._O_r._0vi(false);
         }
      }
      
      public function _0bC_(param1:Boolean) : void
      {
         this._0V_2._0bC_(param1);
         this._1V_A_._0bC_(param1);
         if(param1)
         {
            this._O_r._0vi(false);
            this._0V_2._0vi(false);
            this._1V_A_._0vi(false);
         }
         else
         {
            this.update();
         }
      }
   }
}
