package _1F_z
{
   public class _07p
   {
      
      public static const LEFT:String = "leftSide";
      
      public static const RIGHT:String = "rightSide";
       
      
      public var _05k:_1F_z._1Z_D_;
      
      public var _0hj:int = -1;
      
      public var _0Y_p:_1F_z._1Z_D_;
      
      public var _1sB_:int = -1;
      
      public var _0E_K_:int = -1;
      
      public var caller:Class;
      
      public var selected:String;
      
      public function _07p()
      {
         super();
      }
      
      public function clear() : void
      {
         this.caller = null;
         this._05k = null;
         this._0hj = -1;
         this._0Y_p = null;
         this._1sB_ = -1;
         this._0E_K_ = -1;
      }
      
      public function _0V_6() : Boolean
      {
         return this._0E_K_ != -1 && this._1sB_ != -1 && this._0hj != -1 && this._05k != null;
      }
      
      public function _wo() : Boolean
      {
         return this._0Y_p != null && this._05k != null;
      }
   }
}
