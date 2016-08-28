package _ek
{
   import _eN_._0M_5;
   import _f7.Signal;
   
   public class _18o
   {
      
      public static var _1Q_W_:Boolean = false;
       
      
      private var fortune:_0M_5;
      
      private var initialized:Boolean = false;
      
      private var _15N_:Boolean = false;
      
      public var _1D_j:Signal;
      
      public function _18o()
      {
         this._1D_j = new Signal();
         super();
      }
      
      public function getFortune() : _0M_5
      {
         return this.fortune;
      }
      
      public function _0L_7(param1:_0M_5) : void
      {
         this.fortune = param1;
         this.initialized = true;
         _1Q_W_ = true;
         this._1D_j.dispatch();
      }
      
      public function _fk() : Boolean
      {
         return this.initialized;
      }
      
      public function _1f9(param1:Boolean) : void
      {
         this.initialized = param1;
      }
      
      public function get isNew() : Boolean
      {
         return this._15N_;
      }
      
      public function set isNew(param1:Boolean) : void
      {
         this._15N_ = param1;
      }
   }
}
