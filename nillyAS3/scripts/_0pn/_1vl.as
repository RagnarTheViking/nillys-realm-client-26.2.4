package _0pn
{
   import _3b.DialogSignal;
   import _0C_j._ze;
   
   public class _1vl
   {
      
      private static const _01S_:String = "Package Purchased";
      
      private static const _1vf:String = "You\'ve already purchased this package!";
      
      private static const _H_F_:String = "Please check your vault for any items purchased";
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _1vl()
      {
         super();
      }
      
      public function execute() : void
      {
         this._06Z_.dispatch(this._F_Y_());
      }
      
      private function _F_Y_() : _ze
      {
         return new _ze().setTitle(_01S_).setBody(_1vf,_H_F_);
      }
   }
}
