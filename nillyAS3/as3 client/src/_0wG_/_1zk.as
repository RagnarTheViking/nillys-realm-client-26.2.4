package _0wG_
{
   import _0eG_._4N_;
   import _0eG_.Description;
   import flash.utils.getQualifiedClassName;
   
   public class _1zk extends _4N_
   {
       
      
      private var _1Y_Z_:String;
      
      private var _15:Class;
      
      public function _1zk(param1:Class)
      {
         super();
         this._15 = param1;
         this._1Y_Z_ = getQualifiedClassName(param1);
      }
      
      override public function describeTo(param1:Description) : void
      {
         param1.appendText("an instance of ").appendText(this._1Y_Z_);
      }
      
      override public function matches(param1:Object) : Boolean
      {
         return param1 is this._15;
      }
   }
}
