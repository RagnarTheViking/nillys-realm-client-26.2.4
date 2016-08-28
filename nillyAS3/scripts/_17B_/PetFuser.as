package _17B_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _4Z_._1T_i;
   import _1F_z._07p;
   import _1F_z._1Z_D_;
   import _0xn._1uk;
   
   public class PetFuser extends Sprite
   {
       
      
      public const _0__W_:Signal = new Signal(String);
      
      private var _1V_A_:_1T_i;
      
      private var _O_r:_17B_._0rX_;
      
      private var _0V_2:_1T_i;
      
      private var state:_07p;
      
      public function PetFuser()
      {
         this._1V_A_ = new _1T_i();
         this._O_r = _1uk._1U_a();
         this._0V_2 = _1uk._8p();
         super();
         this._1V_A_._R_6 = true;
         addChild(this._1V_A_);
         addChild(this._O_r);
         addChild(this._0V_2);
         this._1V_A_._0__W_.addOnce(this._0H_a);
         this._0V_2._0__W_.addOnce(this._06i);
      }
      
      public function initialize(param1:_07p) : void
      {
         this.state = param1;
         this._G_4(this.state._05k,_07p.LEFT);
         if(this.state._0Y_p)
         {
            this._G_4(this.state._0Y_p,_07p.RIGHT);
         }
         this._1lm();
      }
      
      public function _G_4(param1:_1Z_D_, param2:String) : void
      {
         var _loc3_:_1T_i = null;
         if(param1)
         {
            _loc3_ = param2 == _07p.LEFT?this._1V_A_:this._0V_2;
            _loc3_._G_4(param1);
         }
      }
      
      private function _0H_a() : void
      {
         this._0__W_.dispatch(_07p.LEFT);
      }
      
      private function _06i() : void
      {
         this._0__W_.dispatch(_07p.RIGHT);
      }
      
      public function _1lm() : void
      {
         if(this.state._wo())
         {
            this._O_r._0vi(true);
            this._0V_2._0vi(true);
            this._1V_A_._0vi(true);
         }
         else
         {
            this._0V_2._0vi(this.state._0Y_p == null);
            this._1V_A_._0vi(this.state._05k == null);
            this._O_r._0vi(false);
         }
      }
   }
}
