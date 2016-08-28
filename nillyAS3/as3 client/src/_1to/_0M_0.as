package _1to
{
   import _0E_T_._1zi;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import _0E_T_._1G_k;
   
   public class _0M_0
   {
       
      
      [Inject]
      public var classes:_1zi;
      
      public function _0M_0()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = this.classes._0iF_();
         while(_loc2_ < _loc1_)
         {
            this._10E_(this.classes._0K_B_(_loc2_));
            _loc2_++;
         }
      }
      
      private function _10E_(param1:_0ih) : void
      {
         param1._u5(param1.id == _1zi._14L_);
         this._1tZ_(param1);
      }
      
      private function _1tZ_(param1:_0ih) : void
      {
         var _loc2_:_Y_F_ = null;
         var _loc5_:int = 0;
         var _loc3_:_Y_F_ = param1._E_G_._1sW_();
         var _loc4_:int = param1._E_G_._0iF_();
         while(_loc5_ < _loc4_)
         {
            _loc2_ = param1._E_G_._qU_(_loc5_);
            if(_loc2_ != _loc3_)
            {
               this._hF_(param1._E_G_._qU_(_loc5_));
            }
            _loc5_++;
         }
      }
      
      private function _hF_(param1:_Y_F_) : void
      {
         param1.setState(_1G_k.LOCKED);
      }
   }
}
