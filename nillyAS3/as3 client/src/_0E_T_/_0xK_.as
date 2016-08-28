package _0E_T_
{
   public class _0xK_
   {
       
      
      private const _E_G_:Vector.<_0E_T_._Y_F_> = new Vector.<_0E_T_._Y_F_>(0);
      
      private const map:Object = {};
      
      private var _0hk:_0E_T_._Y_F_;
      
      private var _1hc:_0E_T_._Y_F_;
      
      private var _1D_k:int;
      
      public function _0xK_()
      {
         super();
      }
      
      public function _0iF_() : int
      {
         return this._E_G_.length;
      }
      
      public function _1sW_() : _0E_T_._Y_F_
      {
         return this._0hk;
      }
      
      public function _0sr() : _0E_T_._Y_F_
      {
         return this._1hc;
      }
      
      public function _qU_(param1:int) : _0E_T_._Y_F_
      {
         return this._E_G_[param1];
      }
      
      public function _07z(param1:_0E_T_._Y_F_, param2:Boolean = false) : void
      {
         param1._my.add(this._mq);
         this._E_G_.push(param1);
         this.map[param1.id] = param1;
         this._0F_G_(param1);
         if(param2)
         {
            this._0hk = param1;
            if(!this._1hc)
            {
               this._1hc = param1;
               param1._u5(true);
            }
         }
         else if(param1._0pE_())
         {
            this._1hc = param1;
         }
      }
      
      private function _mq(param1:_0E_T_._Y_F_) : void
      {
         if(param1._0pE_() && this._1hc != param1)
         {
            this._1hc && this._1hc._u5(false);
            this._1hc = param1;
         }
      }
      
      public function _aU_(param1:int) : void
      {
         var _loc2_:_0E_T_._Y_F_ = null;
         this._1D_k = param1;
         for each(_loc2_ in this._E_G_)
         {
            this._0F_G_(_loc2_);
         }
      }
      
      private function _0F_G_(param1:_0E_T_._Y_F_) : void
      {
         if(!param1.skinSelectable)
         {
            param1.setState(_1G_k.UNLISTED);
         }
         else if(param1._0J_m()._0H_d())
         {
            param1.setState(this._P___(param1));
         }
      }
      
      private function _P___(param1:_0E_T_._Y_F_) : _1G_k
      {
         if(!param1.skinSelectable)
         {
            return _1G_k.UNLISTED;
         }
         if(this._1D_k >= param1.unlockLevel && param1._0p7 == null)
         {
            return _1G_k.PURCHASABLE;
         }
         return _1G_k.LOCKED;
      }
      
      public function _nV_(param1:int) : _0E_T_._Y_F_
      {
         return this.map[param1] || this._0hk;
      }
      
      public function _0eX_() : Vector.<_0E_T_._Y_F_>
      {
         var _loc1_:_0E_T_._Y_F_ = null;
         var _loc2_:Vector.<_0E_T_._Y_F_> = new Vector.<_0E_T_._Y_F_>();
         for each(_loc1_ in this._E_G_)
         {
            if(_loc1_._0J_m() != _1G_k.UNLISTED)
            {
               _loc2_.push(_loc1_);
            }
         }
         return _loc2_;
      }
   }
}
