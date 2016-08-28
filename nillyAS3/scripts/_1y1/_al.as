package _1y1
{
   import _f7.Signal;
   import _166.Package;
   
   public class _al
   {
       
      
      public var _0gU_:int = 0;
      
      public var _1gm:Signal;
      
      private var _1J_a:Object;
      
      private var initialized:Boolean;
      
      public function _al()
      {
         this._1gm = new Signal();
         super();
      }
      
      public function _0R_U_() : Boolean
      {
         return this.initialized;
      }
      
      public function _1gl(param1:int) : Package
      {
         return this._1J_a[param1];
      }
      
      public function _1sq(param1:int) : Boolean
      {
         return param1 in this._1J_a;
      }
      
      public function _1i__(param1:Array) : void
      {
         var _loc2_:Package = null;
         this._1J_a = {};
         for each(_loc2_ in param1)
         {
            _loc2_._1gm.add(this._0M_w);
            this._1J_a[_loc2_.packageID] = _loc2_;
         }
         this.initialized = true;
         this._1gm.dispatch();
      }
      
      private function _0M_w() : void
      {
         this._1gm.dispatch();
      }
      
      public function _1kN_(param1:int) : Boolean
      {
         var _loc2_:Package = this._1J_a[param1];
         return _loc2_ && _loc2_._1X_e();
      }
      
      public function _K_W_() : Package
      {
         var _loc1_:Package = null;
         var _loc2_:Package = null;
         for each(_loc1_ in this._1J_a)
         {
            if(_loc2_ == null || _loc1_.priority < _loc2_.priority)
            {
               _loc2_ = _loc1_;
            }
         }
         return _loc1_;
      }
      
      public function _1w8() : Boolean
      {
         return this._0gU_ == 0 && "production".toLowerCase() != "localhost";
      }
      
      public function _1X_Y_() : Boolean
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this._1J_a)
         {
            return true;
         }
         return false;
      }
   }
}
