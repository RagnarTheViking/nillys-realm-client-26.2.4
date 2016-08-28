package _0eG_
{
   public class _0Z_e extends BaseDescription
   {
       
      
      private var _1Z_b:String;
      
      public function _0Z_e()
      {
         super();
         this.clear();
      }
      
      public static function toString(param1:_1I_c) : String
      {
         return new _0Z_e()._1C_f(param1).toString();
      }
      
      override protected function append(param1:Object) : void
      {
         this._1Z_b = this._1Z_b + String(param1);
      }
      
      override public function toString() : String
      {
         return this._1Z_b;
      }
      
      public function clear() : void
      {
         this._1Z_b = "";
      }
   }
}
