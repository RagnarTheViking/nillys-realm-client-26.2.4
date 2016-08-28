package _k1
{
   import flash.utils.Dictionary;
   import _0ps._X_L_;
   import _K_m._0xu;
   
   public class _B_X_
   {
       
      
      public var _0Q_k:Dictionary;
      
      private var _mQ_:_X_L_;
      
      public function _B_X_(param1:_X_L_, param2:Dictionary)
      {
         super();
         this._0Q_k = param2;
         this._mQ_ = param1;
      }
      
      public function _1g0(param1:Class) : _0xu
      {
         return this._0Q_k[param1] = this._0Q_k[param1] || this._mQ_._1B_K_(param1);
      }
      
      public function _1on(param1:Class, param2:_0xu) : void
      {
         this._0Q_k[param1] = param2;
      }
   }
}
