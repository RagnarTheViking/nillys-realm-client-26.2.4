package _uL_
{
   import _1__8._0dX_;
   import _0sm._17m;
   import _1ox._0K_R_;
   import _1__8._0Y_c;
   import _1__8._1Q_O_;
   
   public class _03X_ implements _0dX_
   {
       
      
      private var _U_l:_17m;
      
      private var _B_S_:_0K_R_;
      
      public function _03X_(param1:_1Q_O_)
      {
         super();
         this._U_l = param1._T_X_.getInstance(_17m);
         this._B_S_ = new _0K_R_();
      }
      
      public function log(param1:Object, param2:uint, param3:int, param4:String, param5:Array = null) : void
      {
         var _loc6_:String = _0Y_c.NAME[param2] + " " + param1 + " " + this._B_S_._0d5(param4,param5);
         this._U_l.dispatch(_loc6_);
      }
   }
}
