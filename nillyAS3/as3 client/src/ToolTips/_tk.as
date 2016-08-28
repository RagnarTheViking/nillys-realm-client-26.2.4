package ToolTips
{
   import _1bp._7J_;
   import _1bp.GeneralProjectileComparison;
   import _1bp._1jS_;
   import _1pm._0P_M_;
   import _1bp._0c4;
   import _1bp._0M_i;
   import _1bp._1O_;
   import _1bp._1rL_;
   import _1bp._E_M_;
   import _1bp._0p6;
   import _1bp._aj;
   import _1bp.PoisonComparison;
   import _1bp._7W_;
   import _1bp._0ds;
   import _1bp._0s;
   import _1bp._1i2;
   import _1bp._1vW_;
   
   public class _tk
   {
       
      
      private var hash:Object;
      
      public function _tk()
      {
         super();
         var _loc1_:GeneralProjectileComparison = new GeneralProjectileComparison();
         var _loc2_:_1jS_ = new _1jS_();
         this.hash = {};
         this.hash[_0P_M_._rW_] = _loc1_;
         this.hash[_0P_M_._0P_v] = _loc1_;
         this.hash[_0P_M_._08B_] = _loc1_;
         this.hash[_0P_M_._0F_t] = new _0c4();
         this.hash[_0P_M_._06l] = new _0M_i();
         this.hash[_0P_M_._0aQ_] = _loc2_;
         this.hash[_0P_M_._try] = _loc2_;
         this.hash[_0P_M_._za] = _loc1_;
         this.hash[_0P_M_._0oB_] = new _1O_();
         this.hash[_0P_M_._1J_L_] = new _1rL_();
         this.hash[_0P_M_._1v5] = new _E_M_();
         this.hash[_0P_M_._1S_L_] = _loc2_;
         this.hash[_0P_M_._1__5] = new _0p6();
         this.hash[_0P_M_._0T_K_] = new _aj();
         this.hash[_0P_M_._4m] = _loc1_;
         this.hash[_0P_M_._0xa] = new PoisonComparison();
         this.hash[_0P_M_._0gQ_] = new _7W_();
         this.hash[_0P_M_._0y0] = new _0ds();
         this.hash[_0P_M_._0B_9] = new _0s();
         this.hash[_0P_M_._Q_V_] = new _1i2();
         this.hash[_0P_M_._1N_F_] = new _1vW_();
         this.hash[_0P_M_._Y_7] = _loc1_;
         this.hash[_0P_M_._1F_k] = _loc1_;
      }
      
      public function _tv(param1:XML, param2:XML) : _hT_
      {
         var _loc3_:int = int(param1.SlotType);
         var _loc4_:_7J_ = this.hash[_loc3_];
         var _loc5_:_hT_ = new _hT_();
         if(_loc4_ != null)
         {
            _loc4_._zg(param1,param2);
            _loc5_._10T_ = _loc4_._0N_9;
            _loc5_._1U_C_ = _loc4_._1U_C_;
         }
         return _loc5_;
      }
   }
}
